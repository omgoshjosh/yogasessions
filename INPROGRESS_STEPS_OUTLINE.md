# YogaSessions: Test-Driven Development Plan for [USER STORY TITLE] (User Story [USER STORY NUMBER e.g. 1.3])

This document outlines the steps to complete User Story [USER STORY NUMBER e.g. 1.3]: [USER STORY DESCRIPTION]

### Plan of Action

[REPLACE THE PLAN OF ACTION EXAMPLE BELOW]
- [x] **Analyze Existing Code**: Begin by reading `integration_test/test_helpers.dart` and `pubspec.yaml` to understand the current seeding implementation and asset configuration.
- [x] **Reconcile Data Models with Seed Data**: Carefully review the data models (`yoga_pose.dart`, `yoga_flow.dart`, `yoga_session.dart`, and relationship models) and their tests. Compare their structure to the data in the existing seed files (`yoga_poses_seed.json`, etc.) to identify discrepancies.
- [ ] **Update JSON Seed Files**: Update the JSON seed files to align perfectly with the Freezed data models.
    *   **`yoga_poses_seed.json`**: Ensure all fields from the `YogaPose` model are present.
    *   **`yoga_flows_seed.json`**: Update the main flow objects to match the `YogaFlow` model. Crucially, replace the simple list of pose names in `yoga_flow_poses` with a list of complete `YogaFlowPose` objects, ensuring they conform to the `YogaFlowPose` data model.
    *   **`yoga_sessions_seed.json`**: Update the main session objects to match the `YogaSession` model. Replace the simple lists of flow and pose names in `yoga_session_flows` and `yoga_session_poses` with lists of complete `YogaSessionFlow` and `YogaSessionPose` objects, respectively. This will involve creating detailed JSON objects for each relationship that match their corresponding data models.

- [ ] **Refactor `test_helpers.dart`**: Iterate on the existing `TestHelpers` class.
    *   **`_seedUsers()`**: This method will be refactored to align with best practices. It will create a user in Firebase Auth and then use the `updateProfile()` method to set the `displayName` and `photoURL` directly on the Auth `User` object. The corresponding Firestore document in the `users` collection will *only* be used to store custom data not managed by Auth (e.g., the `isAdmin` flag), avoiding data duplication.
    *   **`seedData()`**: Enhance this method to correctly parse the updated JSON and create documents in Firestore, including handling sub-collections for relationships.
    *   **`clearData()`**: This method will be updated to recursively delete all documents within sub-collections to ensure a truly clean state between tests.
    *   **`_clearAuth()`**: This method will be refactored to make a `DELETE` request to the Firebase Auth Emulator's REST API endpoint. This will purge *all* user accounts from the emulator, providing a 100% clean state between test runs, a significant improvement over the previous client-side-only approach.
    *   **Dependencies**: The `http` package will be added to `pubspec.yaml` to facilitate the REST API call.

- [ ] **Create a Seeding Validation Test**: Create a new integration test file, `integration_test/seeding_test.dart`. This test will call `clearData()`, then `seedData()`, and finally assert that all collections and sub-collections are populated correctly, verifying the entire process.
[END EXAMPLE]

### Relevant Files for Context
[REPLACE THE CONTEXT FILES EXAMPLE BELOW]
*   `README.md`
*   `PLAN.md`
*   `pubspec.yaml`
*   `integration_test/test_helpers.dart`
*   `assets/seeds/users_seed.json`
*   `assets/seeds/yoga_poses_seed.json`
*   `assets/seeds/yoga_flows_seed.json`
*   `assets/seeds/yoga_sessions_seed.json`
*   `lib/models/poses/yoga_pose.dart`
*   `lib/models/flows/yoga_flow.dart`
*   `lib/models/sessions/yoga_session.dart`
*   `lib/models/flows/yoga_flow_pose.dart`
*   `lib/models/sessions/yoga_session_flow.dart`
*   `lib/models/sessions/yoga_session_pose.dart`
*   `test/models/poses/yoga_pose_test.dart`
*   `test/models/flows/yoga_flow_test.dart`
*   `test/models/sessions/yoga_session_test.dart`
[END EXAMPLE]
