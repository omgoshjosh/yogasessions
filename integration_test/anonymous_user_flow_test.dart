
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:yogasessions/main.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:yogasessions/firebase_options.dart';

import 'test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Anonymous User Flow', () {
    late TestHelpers helpers;
    late YogaSessionsApp app;

    setUpAll(() async {
      print('about to await Firebase.initializeApp()');
      // Initialize Firebase.
      await Firebase.initializeApp();

      // If we're in a test environment, point all Firebase services to the local emulators.
      // final host = defaultTargetPlatform == TargetPlatform.android ? '10.0.2.2' : 'localhost';
      // print('about to FirebaseAuth.instance.useAuthEmulator($host, 9099)');
      // await FirebaseAuth.instance.useAuthEmulator(host, 9099);
      // print('about to await FirebaseFirestore.instance.useFirestoreEmulator($host, 7979)');
      // FirebaseFirestore.instance.useFirestoreEmulator(host, 7979);
      // _connectToFirebaseEmulator();
      // Add other emulators like Storage here if needed.
      app = YogaSessionsApp();
      // Instantiate helpers
      helpers = TestHelpers(FirebaseFirestore.instance, FirebaseAuth.instance);
    });

    setUp(() async {
      print('about to await helpers.clearData()');
      // Clear all previous data and seed fresh data for each test
      await helpers.clearData();
      print('about to await helpers.seedData()');
      await helpers.seedData();
    });

    testWidgets('App launches and displays home screen for anonymous user', (WidgetTester tester) async {
      // Start the app
      // await tester.pumpWidget(
      //   ChangeNotifierProvider(
      //     create: (context) => ApplicationState(),
      //     child: YogaSessionsApp(),
      //   ),
      // );
      print('about to pumpWidget');
      await tester.pumpWidget(app);

      print('about to pumpAndSettle');
      // Allow the app to settle
      await tester.pumpAndSettle();

      print('about to expect');
      // Verify the main navigation buttons are present
      expect(find.text('Poses'), findsOneWidget);
      expect(find.text('Flows'), findsOneWidget);
      expect(find.text('Sessions'), findsOneWidget);

      // Verify the Login button is visible for an anonymous user
      expect(find.widgetWithText(TextButton, 'Login'), findsOneWidget);

      // Verify that profile/logout icons are not visible
      expect(find.byIcon(Icons.account_circle), findsNothing);
      expect(find.byIcon(Icons.logout), findsNothing);
    });
  });
}
