import 'package:integration_test/integration_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yogasessions/firebase_options.dart';
import 'package:yogasessions/main.dart' as app;

// Import the test files
import 'seeding_test.dart' as seeding;
// import 'admin_user_flow_test.dart' as admin_user_flow;
import 'anonymous_user_flow_test.dart' as anonymous_user_flow;

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

  // Run the anonymous user flow tests.
  anonymous_user_flow.main();

  // The following tests are commented out and will be enabled one by one.
  // admin_user_flow.main();
}
