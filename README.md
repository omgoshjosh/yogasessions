### **YogaSessions**

`YogaSessions` is a comprehensive Flutter-based mobile application designed for yoga practitioners of all levels. It serves as a personal library and creation tool, allowing users to discover pre-built yoga practices and build their own custom routines from a library of individual poses. The application leverages Firebase for its backend, providing real-time data synchronization and user authentication.

### **Core Features**

*   **Pose Library:** A browsable library of individual yoga poses. Users can view details for each pose and will eventually be able to create their own.
*   **Session & Flow Builders:** Users can combine individual poses to create custom "Sessions" or "Flows," specifying durations and transitions to create a complete practice routine.
*   **Featured Content:** The app provides a curated collection of "featured" poses, sessions, and flows for users to explore.
*   **Personal Library:** Authenticated users can save their favorite featured content and manage their own "custom" creations in a personal, user-specific library.
*   **User Authentication:** A complete login and signup flow to manage user accounts and persist their personal content.
*   **Flexible Navigation:** A robust routing system built with `go_router` that supports nested views and a clear navigational hierarchy.

### **Technical Stack**

*   **Framework:** Flutter
*   **Language:** Dart
*   **Backend:** Firebase (Cloud Firestore & Firebase Authentication)
*   **Navigation:** `go_router`
*   **Data Models:** `freezed` for immutable models and `json_serializable` for data conversion.
*   **Architecture:** A service-based architecture separating UI (`screens`), business logic (`services`), and data structures (`models`).
