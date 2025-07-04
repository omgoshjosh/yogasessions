import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class TestHelpers {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final bool debug;
  final String firebaseProjectId = 'yogasessions-34670';

  TestHelpers(this.firestore, this.auth, {this.debug = false});

  void _log(String message) {
    if (debug) {
      print(message);
    }
  }

  Future<void> seedData() async {
    _log('Seeding data...');
    await _seedUsers();
    await _seedPoses();
    await _seedFlowsAndRelations();
    await _seedSessionsAndRelations();
    _log('Data seeding complete.');
  }

  Future<void> clearData() async {
    _log('Clearing data...');
    // Important: Clear Firestore data first, as it may have dependencies
    // on Auth UIDs, though in this clean-slate approach it's less critical.
    await _clearFirestore();
    await _clearAuth();
    _log('Data clearing complete.');
  }

  /// Seeds users into Firebase Auth and creates corresponding user documents in Firestore.
  ///
  /// This method follows the best practice of using Firebase Authentication as the
  /// primary source for user profile information (displayName, photoURL, email).
  /// The Firestore 'users' collection only stores custom application-specific data
  /// for that user, like the `isAdmin` flag.
  Future<void> _seedUsers() async {
    _log('Seeding users...');
    final usersString = await rootBundle.loadString('assets/seeds/users_seed.json');
    final List<dynamic> usersSeed = json.decode(usersString);

    for (final userSeed in usersSeed) {
      try {
        // 1. Create user in Firebase Auth
        final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: userSeed['email'],
          password: 'password123', // A standard password for all test users
        );
        final User user = userCredential.user!;

        // 2. Update Auth user profile with data that belongs in Auth
        await user.updateProfile(
          displayName: userSeed['displayName'],
          photoURL: userSeed['photoUrl'],
        );
        // Reload user to ensure the app's auth state has the latest profile data
        await user.reload(); 
        final updatedUser = auth.currentUser!;

        _log('Created Auth user: ${updatedUser.email} (UID: ${updatedUser.uid})');

        // 3. Use the generated UID to create a document in Firestore with only custom app data
        await firestore.collection('users').doc(updatedUser.uid).set({
          'isAdmin': userSeed['isAdmin'] ?? false,
          'email': updatedUser.email, // Storing for convenience, but Auth is source of truth
        });
        _log('Created Firestore user record for ${updatedUser.email}');

      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          _log('User with email ${userSeed['email']} already exists in Auth. Skipping creation.');
        } else {
          _log('Error seeding user ${userSeed['email']}: ${e.message}');
          rethrow; // Rethrow other auth errors
        }
      } catch (e) {
        _log('An unexpected error occurred while seeding user ${userSeed['email']}: $e');
        rethrow;
      }
    }
    _log('User seeding finished.');
  }

  /// Seeds the 'poses' collection from a JSON file.
  Future<void> _seedPoses() async {
    _log('Seeding yoga poses...');
    final posesString = await rootBundle.loadString('assets/seeds/yoga_poses_seed.json');
    final Map<String, dynamic> data = json.decode(posesString);
    final List<dynamic> poses = data['yoga_poses'];

    for (final pose in poses) {
      final String docId = pose['name']; // Using name as ID for predictability in tests
      await firestore.collection('poses').doc(docId).set(pose);
      _log('  - Seeded pose: $docId');
    }
    _log('Pose seeding finished.');
  }

  /// Seeds the 'flows' collection and their 'yoga_flow_poses' sub-collections.
  Future<void> _seedFlowsAndRelations() async {
    _log('Seeding yoga flows and relations...');
    final flowsString = await rootBundle.loadString('assets/seeds/yoga_flows_seed.json');
    final Map<String, dynamic> flowsData = json.decode(flowsString);

    final List<dynamic> flows = flowsData['yoga_flows'];
    final Map<String, dynamic> relations = flowsData['yoga_flow_poses'];

    for (final flow in flows) {
      final String flowId = flow['name']; // Use name as ID for predictability
      await firestore.collection('flows').doc(flowId).set(flow);
      _log('  - Seeded flow: $flowId');

      if (relations.containsKey(flowId)) {
        final List<dynamic> poses = relations[flowId];
        _log('    - Seeding ${poses.length} related poses for flow: $flowId');
        for (final pose in poses) {
          // Let Firestore generate the ID for the sub-collection document
          await firestore
              .collection('flows')
              .doc(flowId)
              .collection('yoga_flow_poses')
              .add(pose);
           _log('      - Added pose: ${pose['name']}');
        }
      }
    }
     _log('Flow seeding finished.');
  }

  /// Seeds the 'sessions' collection and their related sub-collections.
  Future<void> _seedSessionsAndRelations() async {
    _log('Seeding yoga sessions and relations...');
    final sessionsString = await rootBundle.loadString('assets/seeds/yoga_sessions_seed.json');
    final Map<String, dynamic> sessionsData = json.decode(sessionsString);

    final List<dynamic> sessions = sessionsData['yoga_sessions'];
    final Map<String, dynamic> flowRelations = sessionsData['yoga_session_flows'];
    final Map<String, dynamic> poseRelations = sessionsData['yoga_session_poses'];

    for (final session in sessions) {
      final String sessionId = session['name']; // Use name for ID
      await firestore.collection('sessions').doc(sessionId).set(session);
      _log('  - Seeded session: $sessionId');

      // Seed related flows in the sub-collection
      if (flowRelations.containsKey(sessionId)) {
        final List<dynamic> flows = flowRelations[sessionId];
        _log('    - Seeding ${flows.length} related flows for session: $sessionId');
        for (final flow in flows) {
          await firestore
              .collection('sessions')
              .doc(sessionId)
              .collection('yoga_session_flows')
              .add(flow);
          _log('      - Added flow: ${flow['name']}');
        }
      }

      // Seed related poses in the sub-collection
      if (poseRelations.containsKey(sessionId)) {
        final List<dynamic> poses = poseRelations[sessionId];
         _log('    - Seeding ${poses.length} related poses for session: $sessionId');
        for (final pose in poses) {
          await firestore
              .collection('sessions')
              .doc(sessionId)
              .collection('yoga_session_poses')
              .add(pose);
          _log('      - Added pose: ${pose['name']}');
        }
      }
    }
    _log('Session seeding finished.');
  }

  /// Clears all documents from the main collections and their known sub-collections.
  ///
  /// This method performs a recursive deletion, ensuring that tests start with a
  /// completely empty database. It deletes items in sub-collections before
  /// deleting the parent documents.
  Future<void> _clearFirestore() async {
    _log('Clearing Firestore...');
    final collections = ['sessions', 'flows', 'poses', 'users'];
    final subCollections = {
      'sessions': ['yoga_session_flows', 'yoga_session_poses'],
      'flows': ['yoga_flow_poses'],
    };

    for (final collectionName in collections.reversed) { // Reverse order might help with dependencies
      _log('  - Clearing collection: $collectionName');
      try {
        final collection = await firestore.collection(collectionName).get();
        for (final doc in collection.docs) {
          // Recursively delete known sub-collections first
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

  /// Clears all users from the Firebase Auth emulator.
  ///
  /// This method is crucial for ensuring tests are hermetic and repeatable.
  /// The client SDKs cannot delete other users, so we make a direct REST API call
  /// to the Auth emulator's endpoint to purge all existing user accounts.
  /// This is the equivalent of using the Firebase Admin SDK for this purpose.
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
