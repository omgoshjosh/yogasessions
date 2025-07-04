import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yogasessions/services/seeding_service.dart';

class TestHelpers {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final bool debug;
  final String firebaseProjectId = 'yogasessions-34670';
  late final SeedingService _seedingService;

  TestHelpers(this.firestore, this.auth, {this.debug = false}) {
    _seedingService = SeedingService(
      auth: auth,
      firestore: firestore,
      debug: debug,
    );
  }

  void _log(String message) {
    if (debug) {
      print(message);
    }
  }

  Future<void> seedData() async {
    _log('TestHelpers: Delegating seeding to SeedingService...');
    await _seedingService.seedData();
    _log('TestHelpers: Seeding complete.');
  }

  Future<void> clearData() async {
    _log('Clearing data...');
    await _clearFirestore();
    await _clearAuth();
    _log('Data clearing complete.');
  }

  Future<void> _clearFirestore() async {
    _log('Clearing Firestore...');
    final collections = ['sessions', 'flows', 'poses', 'users'];
    final subCollections = {
      'sessions': ['yoga_session_flows', 'yoga_session_poses'],
      'flows': ['yoga_flow_poses'],
    };

    for (final collectionName in collections.reversed) {
      _log('  - Clearing collection: $collectionName');
      try {
        final collection = await firestore.collection(collectionName).get();
        for (final doc in collection.docs) {
          if (subCollections.containsKey(collectionName)) {
            for (final subCollectionName in subCollections[collectionName]!) {
              _log('    - Deleting sub-collection: $subCollectionName in doc ${doc.id}');
              final subCollection = await doc.reference.collection(subCollectionName).get();
              for (final subDoc in subCollection.docs) {
                await subDoc.reference.delete();
              }
            }
          }
          await doc.reference.delete();
          _log('    - Deleted doc: ${doc.id}');
        }
      } catch (e) {
        _log('Error clearing collection $collectionName: $e');
      }
    }
    _log('Firestore clearing finished.');
  }

  Future<void> _clearAuth() async {
    _log('Clearing Auth users via Emulator REST API...');
    final host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    final url = 'http://$host:9099/emulator/v1/projects/$firebaseProjectId/accounts';

    try {
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        _log('  - Successfully cleared all Auth users.');
      } else {
        _log('  - Warning: Failed to clear Auth users. Status: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      _log('  - Error during auth cleanup REST call: $e');
    }
    _log('Auth cleanup finished.');
  }
}
