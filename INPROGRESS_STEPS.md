# YogaSessions: Test-Driven Development Plan for Build the Read-Only User Experience (User Story 4.1)

This document outlines the steps to complete User Story 4.1: "As a new user, I want to open the app and immediately see a list of featured yoga sessions I can explore, and browse all content without an account."

### Plan of Action

- [ ] **Write Integration Tests First**: In keeping with TDD, create a new test file: `integration_test/read_only_user_flow_test.dart`. This test will initially fail and will guide development. It should verify the following user journey:
    *   The app loads to a `PublicHomeScreen` that shows options to navigate to Poses, Flows, and Sessions.
    *   Tapping "Sessions" navigates to a `FeaturedSessionsScreen` that lists all `isPublished: true` sessions from Firestore.
    *   Tapping a specific session from the list navigates to a `SessionDetailScreen` which correctly displays the details of that session, including its child poses and flows from sub-collections.
    *   (Optional but recommended) Repeat the process for the Flows and Poses journeys.

- [ ] **Implement the `PublicHomeScreen`**: Create a simple, stateless widget that serves as the main entry point for anonymous users. It will contain buttons or navigation elements to take the user to the "Featured" screens for each content type.

- [ ] **Implement "Featured" List Screens**:
    *   Create `FeaturedSessionsScreen`, `FeaturedFlowsScreen`, and `FeaturedPosesScreen`.
    *   These screens will be stateful widgets that use the existing `FirestoreService` to fetch and display a stream of published content.
    *   Create a reusable `ListItem` widget to maintain a consistent look and feel across these screens.

- [ ] **Implement "Detail" Screens**:
    *   Create `SessionDetailScreen`, `FlowDetailScreen`, and `PoseDetailScreen`.
    *   These screens will receive an `id` from `go_router`'s path parameters.
    *   They will use the `FirestoreService` to fetch the details of a single document by its ID.
    *   The `SessionDetailScreen` and `FlowDetailScreen` must also implement the logic to fetch and display the contents of their respective sub-collections (`yoga_session_poses`, `yoga_session_flows`, `yoga_flow_poses`).

- [ ] **Update Navigation**: Add the new routes for all the created screens to the `_router` object in `lib/main.dart`.

- [ ] **Run and Pass Tests**: Continuously run the integration test created in the first step. This story is considered "done" only when all tests in `read_only_user_flow_test.dart` are passing.

- [ ] **Update `app_test.dart`**: Once the feature is complete and tested, import and call the new `read_only_user_flow_test.dart` from the main `integration_test/app_test.dart` entry point to include it in the CI test suite.

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
