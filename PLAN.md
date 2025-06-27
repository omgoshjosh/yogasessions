# YogaSessions: Agile Development Plan

This document outlines the development plan for the YogaSessions application. We will follow an agile, test-driven methodology to build the application in a series of iterative milestones, culminating in a V1 release.

## Development Workflow

All new features will be built following this iterative loop:

1.  **Write Tests:** Add failing integration tests to the `feature-branch` that define the specification and desired user experience for the new code.
2.  **Iterate on Solutions:** Write the application code required to make the tests pass.
3.  **Create Pull Request:** Make a PR from the `feature-branch` to the `rc` (release candidate) branch. This will trigger the Continuous Integration (CI) pipeline to run all automated tests.
4.  **Review & Merge:** Once the PR is approved and all tests pass, merge the code into `rc`.
5.  **Test on Staging:** The merge to `rc` will trigger a Continuous Deployment (CD) pipeline, which deploys the app to a private staging environment (e.g., Firebase App Distribution). The feature can then be tested manually in a real-world environment.
6.  **Promote to Production:** Periodically, the `rc` branch will be merged into `main` to release the new features to production users.

---

## Project Milestones

### Milestone 1: The Read-Only Experience (v0.1)

**Goal:** An anonymous user can download and browse all public content. This provides immediate value and serves as the foundation for the app.

*   **User Stories:**
    *   "As a new user, I want to open the app and immediately see a list of featured yoga sessions I can explore."
    *   "As a new user, I want to browse all available yoga poses and see their details (including images/videos) without creating an account."
*   **Key Tasks:**
    1.  **Testing:** Write integration tests for the complete anonymous user journey.
    2.  **Implementation:**
        *   Create a `PublicHomeScreen` and set it as the default route (`/`).
        *   Implement the "featured" screens (`FeaturedPosesScreen`, etc.) to display global content.
        *   Implement an `AdminScreen` with a function to seed the database from local JSON files.
        *   Generate or source default images/videos for the seed poses and link them in the seed data.
    3.  **CI/CD:** Set up CI to run tests and CD to deploy the `rc` branch to a staging environment.

### Milestone 2: Authentication (v0.2)

**Goal:** A user can create an account, log in, and log out.

*   **User Stories:**
    *   "As a user, I want to sign up for an account using my email."
    *   "As a user, I want to log in to access my personal content."
*   **Key Tasks:**
    1.  **Testing:** Write integration tests for signup, login, and logout flows.
    2.  **Implementation:**
        *   Build the UI and logic for the `LoginScreen` and `SignupScreen`.
        *   Integrate with Firebase Authentication.
        *   Add conditional UI elements (e.g., "Save Session" button) that appear only for authenticated users and navigate to the login screen if tapped by an anonymous user.

### Milestone 3: User Library & Content Management (v0.3)

**Goal:** An authenticated user can save featured content and create their own custom content.

*   **User Stories:**
    *   "As a logged-in user, I want to save a featured session to my personal library so I can find it later."
    *   "As a logged-in user, I want to build a new yoga flow from a list of existing poses."
    *   "As a logged-in user, I want to upload an image for a custom pose I create."
*   **Key Tasks:**
    1.  **Testing:** Write integration tests for saving/unsaving content and for the content creation "builder" flows.
    2.  **Implementation:**
        *   Build the UI for the "Saved" and "Custom" screens.
        *   Implement the backend logic to manage user-specific data in Firestore.
        *   Build the `SessionBuilderScreen`, `FlowBuilderScreen`, and `PoseBuilderScreen`.
        *   Add functionality for users to upload their own media for custom content.

### Milestone 4: Profile & Settings (v0.4)

**Goal:** A user can manage their profile and application settings.

*   **User Stories:**
    *   "As a user, I want to see my profile information."
    *   "As a user, I want to be able to log out from the profile screen."
*   **Key Tasks:**
    1.  **Testing:** Write integration tests for viewing the profile and managing settings.
    2.  **Implementation:** Build the `ProfileScreen` and `SettingsScreen`.

### Milestone 5: V1 Release

**Goal:** Finalize the application for a public V1 release.

*   **Key Tasks:**
    1.  **Final Polish:** A full pass on UI/UX, adding loading indicators, animations, and graceful error handling.
    2.  **Regression Testing:** Ensure all features from previous milestones work together seamlessly.
    3.  **Deployment Prep:** Finalize store listings, marketing materials, etc.
    4.  **Launch:** Merge the final `rc` branch to `main` for the official V1.0.0 release.
