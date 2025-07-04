# YogaSessions: Test-Driven Development Plan for Seeding (User Story 1.3)

This document outlines the steps to complete User Story 1.3: "Use seed data to initialize the database for integration tests." and the subsequent work to centralize test execution.

### Plan of Action

- [x] **Analyze Existing Code**: Read `integration_test/test_helpers.dart` and `pubspec.yaml` to understand the seeding implementation.
- [x] **Reconcile Data Models with Seed Data**: Compare data models (`yoga_pose.dart`, etc.) with seed files (`yoga_poses_seed.json`, etc.) to identify discrepancies.
- [x] **Update JSON Seed Files**: Update all JSON seed files to align perfectly with the Freezed data models, including relationship models.
- [x] **Refactor `test_helpers.dart`**:
    - [x] Refactor `_seedUsers()` to align with best practices (create user in Auth, update profile, store only custom data in Firestore).
    - [x] Enhance `seedData()` to correctly parse updated JSON and create documents in Firestore, including sub-collections.
    - [x] Update `clearData()` to recursively delete documents within sub-collections.
    - [x] Refactor `_clearAuth()` to make a `DELETE` request to the Firebase Auth Emulator's REST API endpoint to purge all user accounts.
    - [x] Add the `http` package dependency to `pubspec.yaml`.
- [x] **Create a Seeding Validation Test**: Create `integration_test/seeding_test.dart` to call `clearData()`, then `seedData()`, and assert that all collections and sub-collections are populated correctly.
- [x] **Update Documentation**: Update `README.md` and `PLAN.md` to describe the process of adding new integration tests to a central entry file.
- [x] **Create Central Test Entry Point**: Create a new file, `integration_test/app_test.dart`, to serve as the single entry point for all integration tests.
- [ ] **Consolidate Existing Tests**:
    - [x] ~~Import `integration_test/anonymous_user_flow_test.dart` into `app_test.dart`.~~ (FUTURE WORK)
    - [x] ~~Import `integration_test/admin_user_flow_test.dart` into `app_test.dart`.~~ (FUTURE WORK)
    - [x] Import `integration_test/seeding_test.dart` into `app_test.dart`.
    - [x] Add calls to each imported test's `main()` method from within the `main()` method of `app_test.dart`.
- [ ] **Fix build errors**: Dart analysis errors, unit and widget test errors, and integration test errors.
- [ ] **Update CI Configuration (if necessary)**: Ensure the CI pipeline is configured to run only `integration_test/app_test.dart`.
### Relevant Files for Context

*   `README.md`
*   `PLAN.md`
*   `pubspec.yaml`
*   `integration_test/test_helpers.dart`
*   `integration_test/app_test.dart`
*   `integration_test/anonymous_user_flow_test.dart`
*   `integration_test/admin_user_flow_test.dart`
*   `integration_test/seeding_test.dart`
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
