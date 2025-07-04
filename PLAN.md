# YogaSessions: Agile Development Plan

This document outlines the development plan for the YogaSessions application. We will follow an agile, test-driven methodology to build the application in a series of iterative milestones and sprints, culminating in a V1 release.

## Development Workflow

All new features will be built following this iterative loop:

1.  **Write Tests:** Add failing integration tests to the `feature-branch` that define the specification and desired user experience for the new code.
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
9.  **Deployment & Release**

---

## Project Milestones & Sprints

### Milestone 1: The Read-Only Experience (v0.1)

**Goal:** An anonymous user can download and browse all public content. This provides immediate value and serves as the foundation for the app.

*   **User Stories:**
    *   "As a new user, I want to open the app and immediately see a list of featured yoga sessions I can explore."
    *   "As a new user, I want to browse all Featured yoga poses, flows, and sessions and see their details (including images/videos) without creating an account."
    *   "As a developer, I want to set up the project, CI/CD, and data models to support the core application."

*   **Key Tasks & Associated Sprint Stories:**
    - [x]   **Project Setup (User Story 1.1):** Initialize Flutter project, add dependencies, set up Firebase.
    - [x]   **Continuous Integration (User Story 1.2):** Set up GitHub Actions to test pull requests against the `rc` branch.
    - [ ]   **Continuous Deployment (User Story 1.3):** Set up GitHub Actions to deploy the `rc` branch to a staging environment.
    - [ ]   **Data Models (User Story 3.1):** Create Freezed data classes for `YogaPose`, `YogaFlow`, and `YogaSession`.
    - [ ]   **View Read-Only Library (User Story 4.1):** Create Firestore collections, seed data, and build the UI to display the public library (`PublicHomeScreen`, `FeaturedPosesScreen`, etc.).
    - [ ]   **Admin Seeding:** Implement an `AdminScreen` with a function to seed the database from local JSON files.

### Milestone 2: Authentication (v0.2)

**Goal:** A user can create an account, log in, and log out.

*   **User Stories:**
    *   "As a user, I want to sign up for an account using my email."
    *   "As a user, I want to log in to access my personal content."
    *   "As a user, I want to be able to use the app anonymously and later convert my account to a permanent one so that I don't have to create an account right away."

*   **Key Tasks & Associated Sprint Stories:**
    - [ ] **Anonymous & Permanent User Accounts (User Story 2.1):** Implement Firebase anonymous auth, build the UI for `LoginScreen`, `SignupScreen`, and the account conversion flow.
    - [ ] Add conditional UI elements (e.g., "Save Session" button) that appear only for authenticated users.
    - [ ] Write integration tests for signup, login, and logout flows.

### Milestone 3: User Library & Content Management (v0.3)

**Goal:** An authenticated user can save featured content and create their own custom content.

*   **User Stories:**
    *   "As a logged-in user, I want to save a featured session to my personal library so I can find it later."
    *   "As a logged-in user, I want to build a new yoga flow from a list of existing poses."
    *   "As a logged-in user, I want to upload an image for a custom pose I create."

*   **Key Tasks & Associated Sprint Stories:**
    - [ ] **Favorites (User Story 5.1):** Implement the `favorites` collection and UI for saving/viewing favorite items.
    - [ ] **Custom Content:** Build the UI/backend for `SessionBuilderScreen`, `FlowBuilderScreen`, and `PoseBuilderScreen`.
    - [ ] **Media Uploads:** Add functionality for users to upload their own media for custom content.
    - [ ] **Play a Session (User Story 4.2):** Create a "player" screen to play flows/sessions with standard media controls.

### Milestone 4: Profile & Settings (v0.4)

**Goal:** A user can manage their profile and application settings.

*   **User Stories:**
    *   "As a user, I want to see my profile information."
    *   "As a user, I want to be able to log out from the profile screen."

*   **Key Tasks:**
    - [ ] Build the `ProfileScreen` and `SettingsScreen`.
    - [ ] Write integration tests for viewing the profile and managing settings.

### Milestone 5: V1 Release

**Goal:** Finalize the application for a public V1 release.

*   **Key Tasks:**
    - [ ] **Final Polish:** A full pass on UI/UX, adding loading indicators, animations, and graceful error handling.
    - [ ] **Regression Testing:** Ensure all features from previous milestones work together seamlessly.
    - [ ] **Deployment Prep:** Finalize store listings, marketing materials, etc.
    - [ ] **Android App Store Release:** Create a pipeline that builds, signs, and uploads a release-ready Android App Bundle (`.aab`) to the Google Play Store.
    - [ ] **Launch:** Merge the final `rc` branch to `main` for the official V1.0.0 release.

### Subsequent Sprints (Future Work)

The following high-level features will be prioritized and broken down in subsequent sprints after the V1 release.

*   **Instructor/Teacher Content:** As an Instructor or Teacher, I can create, update, and delete my own custom poses, flows, and sessions.
*   **Publishing:** As an Instructor or Teacher, I can publish my custom content to make it available to all users.
*   **"In Sync" Feature:** As a user of a copied object, I want to be notified when the original object has changed and have the option to sync my copy.
*   **Role Management:** Implement the role system and verification process for Instructors and Teachers.
*   **Advanced Filtering:** Implement advanced filtering by description, difficulty, and labels.
*   **iOS App Store Release:** Create a pipeline that builds, signs, and uploads a release-ready iOS app (`.ipa`) to the Apple App Store.
