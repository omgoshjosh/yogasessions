# YogaSessions: Agile Development Plan

This document outlines the development plan for the YogaSessions application. We will follow an agile, test-driven methodology to build the application in a series of iterative milestones and sprints, culminating in a V1 release.

## Development Workflow

All new features will be built following this iterative loop:

1.  **Write Tests:** Add failing integration tests to the `feature-branch` that define the specification and desired user experience for the new code.
    *   **Note on Integration Tests**: All integration tests are managed and run from a single entry point: `integration_test/app_test.dart`. This allows the CI system to discover and execute all test suites by running a single command. To add a new test suite:
        1.  Create your new test file (e.g., `integration_test/new_feature_test.dart`).
        2.  Import your new test file into `integration_test/app_test.dart` and give it a prefix (e.g., `import 'new_feature_test.dart' as new_feature;`).
        3.  Add a call to your new test's `main()` method inside the `main()` function of `app_test.dart` (e.g., `new_feature.main();`).
2.  **Iterate on Solutions:** Write the application code required to make the tests pass.
3.  **Create Pull Request:** Make a PR from the `feature-branch` to the `rc` (release candidate) branch. This will trigger the Continuous Integration (CI) pipeline to run all automated tests.
4.  **Review & Merge:** Once the PR is approved and all tests pass, merge the code into `rc`.
5.  **Test on Staging:** The merge to `rc` will trigger a Continuous Deployment (CD) pipeline, which deploys the app to a private staging environment (e.g., Firebase App Distribution). The feature can then be tested manually in a real-world environment.
6.  **Promote to Production:** Periodically, the `rc` branch will be merged into `main` to release the new features to production users.

---

## Definition of Done

To ensure quality and a steady development pace, the following criteria must be met for each user story and sprint:

*   **User Story Completion:** A user story is not considered "done" until a pull request with its changes has been opened, targets the `rc` branch, and all automated checks (linter, tests) are passing.
*   **Sprint Completion:** A sprint is not considered "done" until all of its user stories are complete and the resulting features have been deployed. No new sprint will begin until the previous sprint's work is successfully deployed.

---

## Project Epics

1.  **Core Project Setup & Foundation**
2.  **User Authentication**
3.  **Data Models & Persistence**
4.  **Read-Only Library (Poses, Flows, Sessions)**
5.  **User-Specific Content (Favorites, Custom Sessions)**
6.  **Content Creation & Management (Instructors/Teachers)**
7.  **"In Sync" Feature**
8.  **Admin Functionality**
9.  **Security & Hardening**
10. **Deployment & Release**

---

## Project Milestones & Sprints

### Milestone 1: The Read-Only Experience (v0.1)

**Goal:** An anonymous user can download and browse all public content. This provides immediate value and serves as the foundation for the app.

#### Epic 1: Core Project Setup & Foundation
*   **User Story 1.1:** "As a developer, I want to set up the project, CI/CD, and data models to support the core application."
    *   **Tasks:**
        - [x] Initialize Flutter project, add dependencies, set up Firebase.
        - [x] Set up GitHub Actions to test pull requests against the `rc` branch.
        - [x] Use seed data to initialize the database for integration tests (User Story 1.3).
        - [ ] Set up GitHub Actions to deploy the `rc` branch to a staging environment (User Story 1.5).

#### Epic 3: Data Models & Persistence
*   **User Story 3.1:** "As a developer, I want to create Freezed data classes for `YogaPose`, `YogaFlow`, and `YogaSession`."
    *   **Tasks:**
        - [x] Create Freezed data classes for `YogaPose`, `YogaFlow`, and `YogaSession`.

#### Epic 4: Read-Only Library (Poses, Flows, Sessions)
*   **User Story 4.1:** "As a new user, I want to open the app and immediately see a list of featured yoga sessions I can explore, and browse all content without an account."
    *   **Tasks:**
        - [ ] Create Firestore collections, seed data, and build the UI to display the public library (`PublicHomeScreen`, `FeaturedPosesScreen`, etc.).
*   **User Story 4.3 (New):** "As a user viewing a list of featured content, I want to filter the list by name, description, difficulty, and labels so I can find what I'm looking for more easily."
    *   **Tasks:**
        - [ ] Implement UI controls for filtering on `FeaturedPosesScreen`, `FeaturedFlowsScreen`, and `FeaturedSessionsScreen`.
        - [ ] Update `FirestoreService` to support combining multiple `where` clauses for filtering.
        - [ ] Write integration tests for the filtering functionality.
*   **User Story 4.4 (New):** "As a user viewing a piece of featured content, I want a 'Copy Link' button so I can share it with others."
    *   **Tasks:**
        - [ ] Implement a 'Copy Link' button on the `SessionDetailScreen`, `FlowDetailScreen`, and `PoseDetailScreen`.
        - [ ] Implement the logic to copy a deep link to the clipboard.
        - [ ] Write integration tests to verify the button exists and the copy functionality works.

#### Epic 8: Admin Functionality
*   **User Story 1.4:** "As an app admin, I need an admin screen to sync the Firestore database with seed data for poses, flows, and sessions, so that I can develop and test the UI for the read-only library."
    *   **Tasks:**
        - [ ] Implement an `AdminScreen` with a function to sync the database from local JSON files.

#### Epic 9: Security & Hardening
*   **User Story 9.1:** "As a developer, I need to implement and test comprehensive Firestore security rules that enforce the access control logic defined in the project's `README.md`."
    *   **Note:** To unblock development, this story begins with implementing permissive rules. The primary task is to replace them with production-ready rules before this milestone is complete.
    *   **Tasks:**
        - [ ] Write temporary, permissive rules to `firestore.rules` to enable initial integration testing.
        - [ ] Replace permissive rules with production-ready Firestore security rules that correctly enforce access for anonymous users, authenticated users, and admins.

### Milestone 2: Authentication (v0.2)

**Goal:** A user can create an account, log in, and log out.

#### Epic 2: User Authentication
*   **User Story 2.1:** "As a user, I want to sign up, log in, use the app anonymously, and later convert my anonymous account to a permanent one."
    *   **Tasks:**
        - [ ] Implement Firebase anonymous auth.
        - [ ] Build the UI for `LoginScreen`, `SignupScreen`, and the account conversion flow.
        - [ ] Add conditional UI elements (e.g., "Save Session" button) that appear only for authenticated users.
        - [ ] Write integration tests for signup, login, and logout flows.

### Milestone 3: User Library & Content Management (v0.3)

**Goal:** An authenticated user can save featured content and create their own custom content.

#### Epic 5: User-Specific Content (Favorites, Custom Sessions)
*   **User Story 5.1:** "As a logged-in user, I want to save a featured session to my personal library so I can find it later."
    *   **Tasks:**
        - [ ] Implement the `favorites` collection and UI for saving/viewing favorite items.

#### Epic 6: Content Creation & Management (Instructors/Teachers)
*   **User Story 6.1:** "As a logged-in user, I want to build a new yoga flow from a list of existing poses and upload images for custom poses I create."
    *   **Tasks:**
        - [ ] Build the UI/backend for `SessionBuilderScreen`, `FlowBuilderScreen`, and `PoseBuilderScreen`.
        - [ ] Add functionality for users to upload their own media for custom content.

#### Epic 4: Read-Only Library (Poses, Flows, Sessions)
*   **User Story 4.2:** "As a user, I want to play a session or flow."
    *   **Tasks:**
        - [ ] Create a "player" screen to play flows/sessions with standard media controls.

### Milestone 4: Profile & Settings (v0.4)

**Goal:** A user can manage their profile and application settings.

#### Epic 2: User Authentication
*   **User Story 2.2:** "As a user, I want to see my profile information and be able to log out."
    *   **Tasks:**
        - [ ] Build the `ProfileScreen` and `SettingsScreen`.
        - [ ] Write integration tests for viewing the profile and managing settings.

### Milestone 5: V1 Release

**Goal:** Finalize the application for a public V1 release.

#### Epic 10: Deployment & Release
*   **User Story 10.1:** "As a developer, I want to prepare the application for a V1 public release."
    *   **Tasks:**
        - [ ] **Final Polish:** A full pass on UI/UX, adding loading indicators, animations, and graceful error handling.
        - [ ] **Regression Testing:** Ensure all features from previous milestones work together seamlessly.
        - [ ] **Deployment Prep:** Finalize store listings, marketing materials, etc.
        - [ ] **Android App Store Release:** Create a pipeline that builds, signs, and uploads a release-ready Android App Bundle (`.aab`) to the Google Play Store.
        - [ ] **Launch:** Merge the final `rc` branch to `main` for the official V1.0.0 release.

---

### Subsequent Sprints (Future Work)

The following high-level features will be prioritized and broken down in subsequent sprints after the V1 release.

*   **Instructor/Teacher Content:** As an Instructor or Teacher, I can create, update, and delete my own custom poses, flows, and sessions.
*   **Publishing:** As an Instructor or Teacher, I can publish my custom content to make it available to all users.
*   **"In Sync" Feature:** As a user of a copied object, I want to be notified when the original object has changed and have the option to sync my copy.
*   **Role Management:** Implement the role system and verification process for Instructors and Teachers.
*   **Advanced Filtering:** Implement advanced filtering by description, difficulty, and labels.
*   **iOS App Store Release:** Create a pipeline that builds, signs, and uploads a release-ready iOS app (`.ipa`) to the Apple App Store.
