
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class TestHelpers {
  final FirebaseFirestore firestore;
  final FirebasemkAuth auth;

  TestHelpers(this.firestore, this.auth);

  Future<void> seedData() async {
    await _seedUsers();
    // In the future, we will uncomment these lines to seed all data.
    // await _seedPoses();
    // await _seedFlowsAndRelations();
    // await _seedSessionsAndRelations();
  }

  Future<void> clearData() async {
    await _clearFirestore();
    await _clearAuth();
  }

  Future<void> _seedUsers() async {
    final usersString = await rootBundle.loadString('assets/seeds/users_seed.json');
    final List<dynamic> usersSeed = json.decode(usersString);

    for (final userSeed in usersSeed) {
      User? user;
      // 1. Create user in Firebase Auth
      if (userSeed['email'] != null) {
        print('about to createUserWithEmailAndPassword');
        UserCredential? userCredential = await auth.createUserWithEmailAndPassword(
          email: userSeed['email'],
          password: 'password123', // A standard password for all test users
        );
        if (userSeed['isEmailVerified'] == true) {
          // Note: This does not actually send a verification email in the emulator.
          // It just sets the flag. We might need a more robust way to handle this,
          // but for now it mirrors the `isEmailVerified` property.
        }
        user = userCredential.user;
      } else {
        print('about to signInAnonymously');
        // Create an anonymous user
        // user = (await auth.signInAnonymously()).user;
        try {
          print(auth);
          print('what is auth above');
          final userCredential =
          await auth.signInAnonymously();
          user = userCredential.user;
          print('Signed in with temporary account.');
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            case 'operation-not-allowed':
              print('Anonymous auth has not been enabled for this project.');
              break;
            default:
              print(e);
              print('Unknown error.');
          }
          rethrow;
        }
        print('done signed in anonymously');
      }

      // 2. Use the generated UID to create a document in Firestore
      if (user != null) {
        print('about to set document in Firestore');
        await firestore.collection('users').doc(user.uid).set({
          'displayName': userSeed['displayName'],
          'photoUrl': userSeed['photoUrl'],
          'isAdmin': userSeed['isAdmin'] ?? false,
          'isEmailVerified': user.emailVerified, // Use the actual value from Auth
          'email': user.email, // Use the actual value from Auth
        });
      }
    }
  }

  // Placeholder for seeding poses
  Future<void> _seedPoses() async {
    final posesString = await rootBundle.loadString('assets/seeds/yoga_poses_seed.json');
    final List<dynamic> poses = json.decode(posesString);
    print('about to add poses');
    for (final pose in poses) {
      await firestore.collection('yoga_poses').add(pose);
    }
  }

  // Placeholder for seeding flows and their relations
  Future<void> _seedFlowsAndRelations() async {
    final flowsString = await rootBundle.loadString('assets/seeds/yoga_flows_seed.json');
    final Map<String, dynamic> flowsData = json.decode(flowsString);
    
    final List<dynamic> flows = flowsData['yoga_flows'];
    final Map<String, dynamic> relations = flowsData['yoga_flow_poses'];

    for (final flow in flows) {
       await firestore.collection('yoga_flows').doc(flow['name']).set(flow);
    }

    for (final entry in relations.entries) {
      final String flowName = entry.key;
      final List<dynamic> poses = entry.value;
      for (final pose in poses) {
        await firestore
            .collection('yoga_flows')
            .doc(flowName)
            .collection('yoga_flow_poses')
            .add(pose);
      }
    }
  }

  // Placeholder for seeding sessions and their relations
  Future<void> _seedSessionsAndRelations() async {
    final sessionsString = await rootBundle.loadString('assets/seeds/yoga_sessions_seed.json');
    final Map<String, dynamic> sessionsData = json.decode(sessionsString);

    final List<dynamic> sessions = sessionsData['yoga_sessions'];
    final Map<String, dynamic> flowRelations = sessionsData['yoga_session_flows'];
    final Map<String, dynamic> poseRelations = sessionsData['yoga_session_poses'];

    for (final session in sessions) {
      await firestore.collection('yoga_sessions').doc(session['name']).set(session);
    }

    for (final entry in flowRelations.entries) {
       final String sessionName = entry.key;
       final List<dynamic> flows = entry.value;
       for (final flow in flows) {
         await firestore
            .collection('yoga_sessions')
            .doc(sessionName)
            .collection('yoga_session_flows')
            .add(flow);
       }
    }
    
    for (final entry in poseRelations.entries) {
       final String sessionName = entry.key;
       final List<dynamic> poses = entry.value;
       for (final pose in poses) {
         await firestore
            .collection('yoga_sessions')
            .doc(sessionName)
            .collection('yoga_session_poses')
            .add(pose);
       }
    }
  }


  Future<void> _clearFirestore() async {
    // A more robust way to clear all collections
    final collections = [
      'users',
      'yoga_poses',
      'yoga_flows',
      'yoga_sessions'
      // We also need to delete subcollections, which is more complex.
      // For now, this is a basic cleanup. A better way is to use the Firebase CLI
      // or a cloud function to clear data in the emulator.
    ];
    
    for (final collectionName in collections) {
      final collection = await firestore.collection(collectionName).get();
      for (final doc in collection.docs) {
        await doc.reference.delete();
      }
    }
  }

  Future<void> _clearAuth() async {
    // This is not directly possible from the client SDK.
    // The common practice is to use the Firebase CLI to clear the Auth emulator.
    // e.g., `firebase auth:export saved-users.json && firebase auth:import --hash-algo=HMAC_SHA256 --rounds=8 saved-users.json`
    // with an empty file.
    // For our tests, we will rely on the test runner to restart the emulator or we'll manage it manually.
  }
}
