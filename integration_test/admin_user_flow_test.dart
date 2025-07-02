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
//   group('Admin User Flow', () {
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
//     testWidgets('Admin user can log in and sees admin controls', (WidgetTester tester) async {
//       // Start the app.
//       await tester.pumpWidget(app);
//       await tester.pumpAndSettle();
//
//       // Navigate to the login screen.
//       await tester.tap(find.widgetWithText(TextButton, 'Login'));
//       await tester.pumpAndSettle();
//
//       // Enter admin credentials.
//       await tester.enterText(
//         find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Email'),
//         'senterright@gmail.com',
//       );
//       await tester.enterText(
//         find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Password'),
//         'password123',
//       );
//       await tester.pumpAndSettle();
//
//       // Tap login.
//       await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
//       await tester.pumpAndSettle(const Duration(seconds: 2));
//
//       // Verify base UI elements are present.
//       expect(find.byIcon(Icons.account_circle), findsOneWidget);
//       expect(find.byIcon(Icons.logout), findsOneWidget);
//
//       // Verify the 'Admin' button is visible in the app bar.
//       expect(find.widgetWithText(TextButton, 'Admin'), findsOneWidget);
//     });
//   });
// }
