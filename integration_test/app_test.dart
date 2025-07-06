import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yogasessions/firebase_options.dart';
import 'package:yogasessions/main.dart' as app;

// Import the test files
import 'seeding_test.dart' as seeding;
// import 'admin_user_flow_test.dart' as admin_user_flow;
// import 'anonymous_user_flow_test.dart' as anonymous_user_flow;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Set up Firebase and emulators once for all tests.
  setUpAll(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await app.connectToFirebaseEmulator();
  });

  // Run the seeding test first to ensure the database is populated.
  seeding.main();

  // The following tests are commented out and will be enabled one by one.
  // admin_user_flow.main();
  // anonymous_user_flow.main();

  // This initial test verifies that the app can start up. It will be removed
  // once the other test suites, which include their own app startup logic,
  // are fully integrated.
  testWidgets('App initialization test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const app.YogaSessionsApp());

    // Wait for any animations, microtasks, or futures to complete.
    await tester.pumpAndSettle();

    try {
      // After initialization, the app should navigate to the PublicHomeScreen,
      // which should contain the text "Featured Sessions".
      // Let's find a widget that is more likely to be a title.
      expect(
        find.widgetWithText(AppBar, 'Featured Sessions'),
        findsOneWidget,
      );
    } catch (e) {
      // If the expectation fails, dump the widget tree to the console.
      debugDumpApp();
      // Re-throw the exception to ensure the test is marked as failed.
      rethrow;
    }
  });
}
