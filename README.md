### **YogaSessions**

`YogaSessions` is a comprehensive Flutter-based mobile application designed for yoga practitioners of all levels. It serves as a personal library and creation tool, allowing users to discover pre-built yoga practices and build their own custom routines from a library of individual poses. The application leverages Firebase for its backend, providing real-time data synchronization and user authentication.

### **Core Features**

*   **Pose Library:** A browsable library of individual yoga poses. Users can view details for each pose and will eventually be able to create their own.
*   **Session & Flow Builders:** Users can combine individual poses to create custom "Sessions" or "Flows," specifying durations and transitions to create a complete practice routine.
*   **Featured Content:** The app provides a curated collection of "featured" poses, sessions, and flows for users to explore.
*   **Personal Library:** Authenticated users can save their favorite featured content and manage their own "custom" creations in a personal, user-specific library.
*   **User Authentication:** A complete login and signup flow to manage user accounts and persist their personal content.
*   **Flexible Navigation:** A robust routing system built with `go_router` that supports nested views and a clear navigational hierarchy.

<details>
  <summary>
    <h3><strong>Development Phases</strong></h3>
  </summary>

The project is being developed in 8 distinct phases:

*   **✅ Phase 1: Foundational UI & Navigation Setup:** Creating all placeholder screens and setting up the initial `GoRouter` configuration.
*   **✅ Phase 2: Advanced Routing and Refinement:** Implementing nested routes, debugging navigation, and ensuring all placeholder screens are correctly displayed.
*   **Phase 3: Authentication:** Building the UI and logic for Login/Signup and integrating with Firebase Authentication.
*   **Phase 4: Core Content Display:** Implementing the "featured" screens to fetch and display public data from Firestore.
*   **Phase 5: User-Specific Content Display:** Building the "saved" and "custom" screens to display data specific to the logged-in user.
*   **Phase 6: Content Creation & Management:** Building the "builder" screens (`PoseBuilderScreen`, `SessionBuilderScreen`, `FlowBuilderScreen`).
*   **Phase 7: User Profile & Settings:** Implementing the `ProfileScreen` and `SettingsScreen`.
*   **Phase 8: Finalization & Polish:** Focusing on error handling, loading states, UI/UX refinement, and final testing.
</details>

### **Technical Stack**

*   **Framework:** Flutter
*   **Language:** Dart
*   **Backend:** Firebase (Cloud Firestore & Firebase Authentication)
*   **Navigation:** `go_router`
*   **Data Models:** `freezed` for immutable models and `json_serializable` for data conversion.
*   **Architecture:** A service-based architecture separating UI (`screens`), business logic (`services`), and data structures (`models`).
