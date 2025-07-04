import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:yogasessions/main.dart'; // For connectToFirebaseEmulator
import 'test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Database Seeding and Clearing', () {
    late TestHelpers helpers;
    late FirebaseFirestore firestore;
    late FirebaseAuth auth;

    setUpAll(() async {
      await connectToFirebaseEmulator();
      firestore = FirebaseFirestore.instance;
      auth = FirebaseAuth.instance;
      helpers = TestHelpers(firestore, auth, debug: true); // Enable logging for clarity
    });

    // A single, comprehensive test to verify the whole seeding/clearing cycle.
    testWidgets('clearData and seedData work correctly', (WidgetTester tester) async {
      // 1. ARRANGE: Start from a clean slate.
      await helpers.clearData();

      // 2. ASSERT (Pre-condition): Verify that the database is empty.
      final posesAfterClear = await firestore.collection('poses').get();
      final flowsAfterClear = await firestore.collection('flows').get();
      final sessionsAfterClear = await firestore.collection('sessions').get();
      final usersAfterClear = await firestore.collection('users').get();
      
      expect(posesAfterClear.docs.isEmpty, isTrue, reason: 'Poses collection should be empty after clearData()');
      expect(flowsAfterClear.docs.isEmpty, isTrue, reason: 'Flows collection should be empty after clearData()');
      expect(sessionsAfterClear.docs.isEmpty, isTrue, reason: 'Sessions collection should be empty after clearData()');
      expect(usersAfterClear.docs.isEmpty, isTrue, reason: 'Users collection should be empty after clearData()');

      // 3. ACT: Seed the database with test data.
      await helpers.seedData();

      // 4. ASSERT (Post-condition): Verify that data has been seeded correctly.

      // A. Check top-level collections are populated.
      final posesAfterSeed = await firestore.collection('poses').get();
      final flowsAfterSeed = await firestore.collection('flows').get();
      final sessionsAfterSeed = await firestore.collection('sessions').get();
      final usersAfterSeed = await firestore.collection('users').get();

      expect(posesAfterSeed.docs.isNotEmpty, isTrue, reason: 'Poses collection should be populated after seedData()');
      expect(flowsAfterSeed.docs.isNotEmpty, isTrue, reason: 'Flows collection should be populated after seedData()');
      expect(sessionsAfterSeed.docs.isNotEmpty, isTrue, reason: 'Sessions collection should be populated after seedData()');
      expect(usersAfterSeed.docs.isNotEmpty, isTrue, reason: 'Users collection should be populated after seedData()');

      // B. Verify a specific Auth user exists.
      try {
        final userCredential = await auth.signInWithEmailAndPassword(email: "senterright@gmail.com", password: "password123");
        expect(userCredential.user, isNotNull, reason: "Admin user should exist in Auth after seeding");
        expect(userCredential.user!.displayName, "Admin User", reason: "Admin user's display name should be set");
        await auth.signOut(); // Clean up session
      } on FirebaseAuthException catch(e) {
        fail("Failed to sign in admin user. This indicates a problem with user seeding. Error: ${e.code}");
      }
      
      // C. Verify sub-collections for a specific seeded flow.
      final sunSalutationFlow = await firestore.collection('flows').doc('Sun Salutation A').get();
      expect(sunSalutationFlow.exists, isTrue, reason: 'Flow "Sun Salutation A" should exist');

      final sunSalutationPoses = await firestore.collection('flows').doc('Sun Salutation A').collection('yoga_flow_poses').get();
      expect(sunSalutationPoses.docs.isNotEmpty, isTrue, reason: 'Sub-collection yoga_flow_poses for "Sun Salutation A" should be populated');
      expect(sunSalutationPoses.docs.length, 4, reason: 'There should be 4 poses in "Sun Salutation A"');

      // D. Verify sub-collections for a specific seeded session.
      final morningEnergizerSession = await firestore.collection('sessions').doc('Morning Energizer').get();
      expect(morningEnergizerSession.exists, isTrue, reason: 'Session "Morning Energizer" should exist');

      final morningEnergizerFlows = await firestore.collection('sessions').doc('Morning Energizer').collection('yoga_session_flows').get();
      expect(morningEnergizerFlows.docs.isNotEmpty, isTrue, reason: 'Sub-collection yoga_session_flows for "Morning Energizer" should be populated');

      final morningEnergizerPoses = await firestore.collection('sessions').doc('Morning Energizer').collection('yoga_session_poses').get();
      expect(morningEnergizerPoses.docs.isNotEmpty, isTrue, reason: 'Sub-collection yoga_session_poses for "Morning Energizer" should be populated');
    });
  });
}
