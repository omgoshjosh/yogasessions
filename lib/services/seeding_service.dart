import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// A service responsible for seeding the Firestore database with initial data.
///
/// This class is designed to be used both by the application (e.g., from an
/// admin screen) and by integration tests. It is extracted from the original
/// TestHelpers to provide a reusable and architecturally sound way to manage
/// seed data.
class SeedingService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final bool _debug;

  SeedingService({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required bool debug,
  })  : _firestore = firestore,
        _auth = auth,
        _debug = debug;

  /// Orchestrates the entire data seeding process.
  Future<void> seedData() async {
    if (_debug) {
      debugPrint('Seeding data...');
    }
    await _seedUsers();
    await _seedPoses();
    await _seedFlowsAndRelations();
    await _seedSessionsAndRelations();
    if (_debug) {
      debugPrint('Data seeding complete.');
    }
  }

  /// Seeds users into Firebase Auth and creates corresponding user documents in Firestore.
  Future<void> _seedUsers() async {
    if (_debug) {
      debugPrint('Seeding users...');
    }
    final usersString = await rootBundle.loadString('assets/seeds/users_seed.json');
    final List<dynamic> usersSeed = json.decode(usersString);

    for (final userSeed in usersSeed) {
      try {
        // Create user in Firebase Auth
        final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: userSeed['email'],
          password: 'password123', // A standard password for all test users
        );
        final User user = userCredential.user!;

        // Update Auth user profile
        await user.updateProfile(
          displayName: userSeed['displayName'],
          photoURL: userSeed['photoUrl'],
        );
        await user.reload();
        final updatedUser = _auth.currentUser!;

        if (_debug) {
          debugPrint('Created Auth user: ${updatedUser.email} (UID: ${updatedUser.uid})');
        }

        // Create a corresponding document in Firestore with custom app data
        await _firestore.collection('users').doc(updatedUser.uid).set({
          'isAdmin': userSeed['isAdmin'] ?? false,
          'email': updatedUser.email,
        });
        if (_debug) {
          debugPrint('Created Firestore user record for ${updatedUser.email}');
        }

      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          if (_debug) {
            debugPrint('User with email ${userSeed['email']} already exists. Skipping.');
          }
        } else {
          if (_debug) {
            debugPrint('Error seeding user ${userSeed['email']}: ${e.message}');
          }
          rethrow;
        }
      } catch (e) {
        if (_debug) {
          debugPrint('An unexpected error occurred while seeding user ${userSeed['email']}: $e');
        }
        rethrow;
      }
    }
    if (_debug) {
      debugPrint('User seeding finished.');
    }
  }

  /// Seeds the 'poses' collection from a JSON file.
  Future<void> _seedPoses() async {
    if (_debug) {
      debugPrint('Seeding yoga poses...');
    }
    final posesString = await rootBundle.loadString('assets/seeds/yoga_poses_seed.json');
    final Map<String, dynamic> data = json.decode(posesString);
    final List<dynamic> poses = data['yoga_poses'];

    for (final pose in poses) {
      final String docId = pose['name'];
      await _firestore.collection('poses').doc(docId).set(pose);
      if (_debug) {
        debugPrint('  - Seeded pose: $docId');
      }
    }
    if (_debug) {
      debugPrint('Pose seeding finished.');
    }
  }

  /// Seeds the 'flows' collection and their 'yoga_flow_poses' sub-collections.
  Future<void> _seedFlowsAndRelations() async {
    if (_debug) {
      debugPrint('Seeding yoga flows and relations...');
    }
    final flowsString = await rootBundle.loadString('assets/seeds/yoga_flows_seed.json');
    final Map<String, dynamic> flowsData = json.decode(flowsString);

    final List<dynamic> flows = flowsData['yoga_flows'];
    final Map<String, dynamic> relations = flowsData['yoga_flow_poses'];

    for (final flow in flows) {
      final String flowId = flow['name'];
      await _firestore.collection('flows').doc(flowId).set(flow);
      if (_debug) {
        debugPrint('  - Seeded flow: $flowId');
      }

      if (relations.containsKey(flowId)) {
        final List<dynamic> poses = relations[flowId];
        if (_debug) {
          debugPrint('    - Seeding ${poses.length} related poses for flow: $flowId');
        }
        for (final pose in poses) {
          await _firestore
              .collection('flows')
              .doc(flowId)
              .collection('yoga_flow_poses')
              .add(pose);
           if (_debug) {
             debugPrint('      - Added pose: ${pose['name']}');
           }
        }
      }
    }
     if (_debug) {
       debugPrint('Flow seeding finished.');
     }
  }

  /// Seeds the 'sessions' collection and their related sub-collections.
  Future<void> _seedSessionsAndRelations() async {
    if (_debug) {
      debugPrint('Seeding yoga sessions and relations...');
    }
    final sessionsString = await rootBundle.loadString('assets/seeds/yoga_sessions_seed.json');
    final Map<String, dynamic> sessionsData = json.decode(sessionsString);

    final List<dynamic> sessions = sessionsData['yoga_sessions'];
    final Map<String, dynamic> flowRelations = sessionsData['yoga_session_flows'];
    final Map<String, dynamic> poseRelations = sessionsData['yoga_session_poses'];

    for (final session in sessions) {
      final String sessionId = session['name'];
      await _firestore.collection('sessions').doc(sessionId).set(session);
      if (_debug) {
        debugPrint('  - Seeded session: $sessionId');
      }

      if (flowRelations.containsKey(sessionId)) {
        final List<dynamic> flows = flowRelations[sessionId];
        if (_debug) {
          debugPrint('    - Seeding ${flows.length} related flows for session: $sessionId');
        }
        for (final flow in flows) {
          await _firestore
              .collection('sessions')
              .doc(sessionId)
              .collection('yoga_session_flows')
              .add(flow);
          if (_debug) {
            debugPrint('      - Added flow: ${flow['name']}');
          }
        }
      }

      if (poseRelations.containsKey(sessionId)) {
        final List<dynamic> poses = poseRelations[sessionId];
         if (_debug) {
           debugPrint('    - Seeding ${poses.length} related poses for session: $sessionId');
         }
        for (final pose in poses) {
          await _firestore
              .collection('sessions')
              .doc(sessionId)
              .collection('yoga_session_poses')
              .add(pose);
          if (_debug) {
            debugPrint('      - Added pose: ${pose['name']}');
          }
        }
      }
    }
    if (_debug) {
      debugPrint('Session seeding finished.');
    }
  }
}
