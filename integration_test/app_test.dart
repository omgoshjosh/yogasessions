import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yogasessions/firebase_options.dart';
import 'package:yogasessions/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Set up Firebase and emulators once for all tests.
  setUpAll(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await app.connectToFirebaseEmulator();
  });

  testWidgets('App initialization test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const app.YogaSessionsApp());

    // Wait for any animations, microtasks, or futures to complete.
    await tester.pumpAndSettle();

    try {
      // After initialization, the app should navigate to the PublicHomeScreen,
      // which should contain the text "Featured Poses".
      // Let's find a widget that is more likely to be a title.
      expect(
        find.widgetWithText(AppBar, 'Featured Poses'),
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
