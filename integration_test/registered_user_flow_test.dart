//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:yogasessions/main.dart';
//
// import 'test_helpers.dart';
//
// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//
//   group('Registered User Flow', () {
//     late TestHelpers helpers;
//     late YogaSessionsApp app;
//
//     setUpAll(() async {
//       // Initialize Firebase.
//       await Firebase.initializeApp();
//
//       // Point all Firebase services to the local emulators.
//       final host = defaultTargetPlatform == TargetPlatform.android ? '10.0.2.2' : 'localhost';
//       await FirebaseAuth.instance.useAuthEmulator(host, 9099);
//       FirebaseFirestore.instance.useFirestoreEmulator(host, 7979);
//
//       app = YogaSessionsApp();
//       helpers = TestHelpers(FirebaseFirestore.instance, FirebaseAuth.instance);
//     });
//
//     setUp(() async {
//       // Clear and seed fresh data for each test.
//       await helpers.clearData();
//       await helpers.seedData();
//     });
//
//     testWidgets('Registered user can log in and see profile UI', (WidgetTester tester) async {
//       // Start the app.
//       await tester.pumpWidget(app);
//       await tester.pumpAndSettle();
//
//       // Tap the login button to navigate to the login screen.
//       await tester.tap(find.widgetWithText(TextButton, 'Login'));
//       await tester.pumpAndSettle();
//
//       // Find the email and password fields.
//       final emailField = find.byWidgetPredicate(
//         (widget) => widget is TextField && widget.decoration?.labelText == 'Email',
//       );
//       final passwordField = find.byWidgetPredicate(
//         (widget) => widget is TextField && widget.decoration?.labelText == 'Password',
//       );
//       expect(emailField, findsOneWidget);
//       expect(passwordField, findsOneWidget);
//
//       // Enter the credentials for the seeded registered user.
//       await tester.enterText(emailField, 'registered.user@example.com');
//       await tester.enterText(passwordField, 'password123');
//       await tester.pumpAndSettle();
//
//       // Find and tap the login button on the sign-in screen.
//       await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
//       await tester.pumpAndSettle(const Duration(seconds: 2));
//
//       // Verify we are back on the home screen.
//       expect(find.text('Poses'), findsOneWidget);
//
//       // Verify the Login button is gone and profile icons are visible.
//       expect(find.widgetWithText(TextButton, 'Login'), findsNothing);
//       expect(find.byIcon(Icons.account_circle), findsOneWidget);
//       expect(find.byIcon(Icons.logout), findsOneWidget);
//     });
//   });
// }
