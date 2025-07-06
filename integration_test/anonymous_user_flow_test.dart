import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yogasessions/main.dart' as app;

void main() {
  group('Anonymous User Flow', () {
    testWidgets('App launches and displays home screen for anonymous user', (WidgetTester tester) async {
      // Start the app.
      await tester.pumpWidget(const app.YogaSessionsApp());
      await tester.pumpAndSettle();

      // Verify the main navigation buttons are present.
      expect(find.byKey(const Key('public_home_screen_title')), findsOneWidget);
      expect(find.byKey(const Key('featured_poses_button')), findsOneWidget);
      expect(find.byKey(const Key('featured_flows_button')), findsOneWidget);
      expect(find.byKey(const Key('featured_sessions_button')), findsOneWidget);

      // Verify the Login and Create Account buttons are visible for an anonymous user.
      expect(find.byKey(const Key('login_button')), findsOneWidget);
      expect(find.byKey(const Key('create_account_button')), findsOneWidget);

      // Verify that profile/logout icons are not visible.
      expect(find.byIcon(Icons.account_circle), findsNothing);
      expect(find.byIcon(Icons.logout), findsNothing);
    });

    group('Comprehensive browsing journey for anonymous user', () {
      // Helper function to avoid repetition.
      Future<void> navigateToAndBack(
        WidgetTester tester, {
        required String buttonKey,
        required String screenTitle,
        required String itemTitle,
        required String detailScreenTitle,
      }) async {
        // Start on the home screen.
        await tester.pumpWidget(const app.YogaSessionsApp());
        await tester.pumpAndSettle();

        // Tap the button to navigate to the list screen.
        await tester.tap(find.byKey(Key(buttonKey)));
        await tester.pumpAndSettle();
        expect(find.text(screenTitle), findsOneWidget);

        // Tap the first item in the list to navigate to the detail screen.
        await tester.tap(find.text(itemTitle).first);
        await tester.pumpAndSettle();
        expect(find.text(detailScreenTitle), findsOneWidget);

        // Navigate back to the list screen.
        await tester.pageBack();
        await tester.pumpAndSettle();
        expect(find.text(screenTitle), findsOneWidget);

        // Navigate back to the home screen.
        await tester.pageBack();
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('public_home_screen_title')), findsOneWidget);
      }

      testWidgets('can navigate through Poses and back', (WidgetTester tester) async {
        await navigateToAndBack(
          tester,
          buttonKey: 'featured_poses_button',
          screenTitle: 'Featured Poses',
          itemTitle: 'Mountain Pose', // Assuming this is seeded data
          detailScreenTitle: 'Mountain Pose',
        );
      });

      testWidgets('can navigate through Flows and back', (WidgetTester tester) async {
        // This test assumes a flow and its child pose are seeded.
        await tester.pumpWidget(const app.YogaSessionsApp());
        await tester.pumpAndSettle();

        // Navigate to the featured flows list.
        await tester.tap(find.byKey(const Key('featured_flows_button')));
        await tester.pumpAndSettle();
        expect(find.text('Featured Flows'), findsOneWidget);

        // Tap on a specific flow.
        await tester.tap(find.text('Sun Salutation A').first);
        await tester.pumpAndSettle();
        expect(find.text('Sun Salutation A'), findsOneWidget);

        // Tap on a pose within that flow.
        await tester.tap(find.text('Downward-Facing Dog').first);
        await tester.pumpAndSettle();
        expect(find.text('Downward-Facing Dog'), findsOneWidget); // Now on the PoseDetailScreen

        // Navigate all the way back up the stack.
        await tester.pageBack(); // Back to Flow Detail
        await tester.pumpAndSettle();
        expect(find.text('Sun Salutation A'), findsOneWidget);

        await tester.pageBack(); // Back to Featured Flows
        await tester.pumpAndSettle();
        expect(find.text('Featured Flows'), findsOneWidget);

        await tester.pageBack(); // Back to Home
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('public_home_screen_title')), findsOneWidget);
      });

      testWidgets('can navigate through Sessions (with child poses and flows) and back', (WidgetTester tester) async {
        await tester.pumpWidget(const app.YogaSessionsApp());
        await tester.pumpAndSettle();

        // 1. Navigate to Featured Sessions
        await tester.tap(find.byKey(const Key('featured_sessions_button')));
        await tester.pumpAndSettle();
        expect(find.text('Featured Sessions'), findsOneWidget);

        // 2. Tap on "Morning Energizer" session
        await tester.tap(find.text('Morning Energizer').first);
        await tester.pumpAndSettle();
        expect(find.text('Morning Energizer'), findsOneWidget);

        // 3. Journey 1: Session -> Pose -> Back
        await tester.tap(find.text('Warrior I').first);
        await tester.pumpAndSettle();
        expect(find.text('Warrior I'), findsOneWidget); // On Pose Detail
        await tester.pageBack();
        await tester.pumpAndSettle();
        expect(find.text('Morning Energizer'), findsOneWidget); // Back to Session Detail

        // 4. Journey 2: Session -> Flow -> Pose -> Back
        await tester.tap(find.text('Sun Salutation A').first); // This is the child flow
        await tester.pumpAndSettle();
        expect(find.text('Sun Salutation A'), findsOneWidget); // On Flow Detail

        await tester.tap(find.text('Upward-Facing Dog').first); // This is a pose within the flow
        await tester.pumpAndSettle();
        expect(find.text('Upward-Facing Dog'), findsOneWidget); // On Pose Detail

        await tester.pageBack(); // Back to Flow Detail
        await tester.pumpAndSettle();
        expect(find.text('Sun Salutation A'), findsOneWidget);

        await tester.pageBack(); // Back to Session Detail
        await tester.pumpAndSettle();
        expect(find.text('Morning Energizer'), findsOneWidget);

        // 5. Navigate all the way back to home
        await tester.pageBack(); // Back to Featured Sessions
        await tester.pumpAndSettle();
        expect(find.text('Featured Sessions'), findsOneWidget);

        await tester.pageBack(); // Back to Home
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('public_home_screen_title')), findsOneWidget);
      });
    });
  });
}
