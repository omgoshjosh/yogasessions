# YogaSessions: Test-Driven Development Plan for Build the Read-Only User Experience (User Story 4.1)

This document outlines the steps to complete User Story 4.1: "As a new user, I want to open the app and immediately see a list of featured yoga sessions I can explore, and browse all content without an account."

### Plan of Action

- [x] **Write Integration Tests First**: Modify `integration_test/anonymous_user_flow_test.dart` to validate the full, explicit read-only user journeys:
    *   **App Launch Journey:** Verifies the `PublicHomeScreen` shows navigation buttons for Poses, Flows, and Sessions, plus "Login" and "Create Account" buttons.
    *   **Comprehensive Browsing Journey:**
        *   Taps "Poses", verifies navigation to `FeaturedPosesScreen`, taps a pose, verifies navigation to `PoseDetailScreen`, and verifies the ability to navigate back.
        *   Taps "Flows", navigates to `FeaturedFlowsScreen`, taps a flow to see `FlowDetailScreen`, taps a pose within that flow to see `PoseDetailScreen`, and verifies the ability to navigate all the way back.
        *   Taps "Sessions", navigates to `FeaturedSessionsScreen`, taps a session to see `SessionDetailScreen`, and then tests both possible nested journeys:
            *   Taps a child *flow*, navigates to `FlowDetailScreen`, taps a child *pose* within that flow, navigates to `PoseDetailScreen`, and verifies the full navigation back.
            *   Taps a child *pose*, navigates to `PoseDetailScreen`, and verifies the full navigation back.

- [x] **Implement the `PublicHomeScreen`**: Create a stateless widget with navigation elements and Login/Create Account buttons.
- [x] **Implement "Featured" List Screens**: Create `FeaturedPosesScreen`, `FeaturedFlowsScreen`, and `FeaturedSessionsScreen` with back buttons.
- [x] **Implement "Detail" Screens**: Create `PoseDetailScreen`, `FlowDetailScreen`, and `SessionDetailScreen`.
- [x] **Update Navigation**: Add all new screen routes to the `_router` in `lib/main.dart`.
- [ ] **Run and Pass Tests**: Continuously run the integration tests until all defined journeys pass.
- [ ] **Update `app_test.dart`**: Ensure `anonymous_user_flow_test.dart` is correctly called from `integration_test/app_test.dart`.

### Relevant Files for Context
*   `README.md`
*   `PLAN.md`
*   `lib/main.dart`
*   `lib/services/firestore_service.dart`
*   `lib/models/poses/yoga_pose.dart`
*   `lib/models/flows/yoga_flow.dart`
*   `lib/models/sessions/yoga_session.dart`
*   `lib/models/flows/yoga_flow_pose.dart`
*   `lib/models/sessions/yoga_session_flow.dart`
*   `lib/models/sessions/yoga_session_pose.dart`
*   `integration_test/app_test.dart`
*   `integration_test/anonymous_user_flow_test.dart`
