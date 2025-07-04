### **YogaSessions**

`YogaSessions` is a comprehensive Flutter-based mobile application designed for yoga practitioners of all levels. It serves as a personal library and creation tool, allowing users to discover pre-built yoga practices and build their own custom routines from a library of individual poses. The application leverages Firebase for its backend, providing real-time data synchronization and user authentication.

### **Core Features**

*   **Pose Library:** A browsable library of individual yoga poses. Users can view details for each pose and will eventually be able to create their own.
*   **Session & Flow Builders:** Users can combine individual poses to create custom "Sessions" or "Flows," specifying durations and transitions to create a complete practice routine.
*   **Featured Content:** The app provides a curated collection of "featured" poses, sessions, and flows for users to explore.
*   **Personal Library:** Authenticated users can save their favorite featured content and manage their own "custom" creations in a personal, user-specific library.
*   **User Authentication:** A complete login and signup flow to manage user accounts and persist their personal content.
*   **Flexible Navigation:** A robust routing system built with `go_router` that supports nested views and a clear navigational hierarchy.

### **Roadmap**

This project is being developed in phases. Here is a summary of the major milestones:

*   **Milestone 1: The Read-Only Experience (v0.1):** An anonymous user can download and browse all public content. This provides immediate value and serves as the foundation for the app.
*   **Milestone 2: Authentication (v0.2):** A user can create an account, log in, and log out.
*   **Milestone 3: User Library & Content Management (v0.3):** An authenticated user can save featured content and create their own custom content.
*   **Milestone 4: Profile & Settings (v0.4):** A user can manage their profile and application settings.
*   **Milestone 5: V1 Release:** Finalize the application for a public V1 release.

### **Requirements**

#### Main functionality for all user accounts
- the Yoga Session App comes with a prebuilt readonly library of poses, flows, and sessions.
- all user accounts may view Featured poses, flows, and sessions
- all user accounts may share via "Copy link" Featured poses, flows, and sessions.
    - future enhancement: share via other apps like google chat, whatsapp, facebook, instagram, etc.
- all user accounts, when viewing, may filter by name, description, difficulty, or label
    - name: text search
    - description: text search
    - difficulty: multi select
    - label: multi select
- all user accounts may play any flow or session to which they have access.
- all user accounts, when playing a flow or session, will be able to pause when playing, resume when paused, go to next, go to previous, and stop.
- anonymous user accounts must be converted to a permanent user account in order to favorite, create, update, delete, or publish a pose, flow, or session.

#### Main functionality for permanent user accounts
- permanent user accounts choose a modifiable role. role is a number between 1 and 5 options are:
    - 1 is Beginner
    - 2 is Practitioner
    - 3 is Instructor (Non-credentialed) [Requires Verification]
    - 4 is Teacher (Credentialed) [Requires Verification]
    - 5 is Admin
- all roles may favorite any pose, flow, or session.
    - all roles may view their Favorites
- all roles may create new sessions from poses or flows to which they have access.
- Instructors and Teachers may copy poses, flows, and sessions to which they have access.
- Instructors and Teachers may manage custom sessions that they own. Actions include:
    - copy from existing
    - create new
    - update existing
    - delete existing
- Instructors and Teachers may publish custom poses, flows, and sessions they have created.
- Instructors and Teachers have access to their Custom poses, flows, and sessions.
- Instructors or Teachers that are downgraded to Practitioner or Beginner may view their existing Custom poses, flows, and sessions.
- Instructors or Teachers that are downgraded to Practitioner or Beginner may no long modify their existing Custom poses, flows, and sessions.
- Beginners or Practitioners may request to transfer ownership of their existing Custom poses, flows, and sessions.

### Key concepts and features to support main functionality
#### General
- poses, flows, and sessions all have the following properties:
    - name
    - description
    - strengthDifficulty
    - flexibilityDifficulty
    - balanceDifficulty
    - overallDifficulty [derived]
    - ownerId
    - originalId [optional]
    - inSync
    - published
- if a pose, flow, or session is published, it is available to all user accounts.
- if a pose, flow, or session is not published, it is only available to the owner.
- overallDifficulty is the average of strengthDifficulty, flexibilityDifficulty, and balanceDifficulty.
- difficulty is a number between 1 and 5.
    - 1 is rest
    - 2 is basic
    - 3 is intermediate
    - 4 is advanced
    - 5 is expert
- 0 or more labels may be associated with and describe features of any pose, flow, or session.
    - initial default labels are
        - Bind
        - Arm Balance
        - Leg Balance
        - Inversion
        - Strength
        - Flexibility
        - Balance
        - Core
        - Full Body
        - Back
        - Shoulder
        - Hip
        - Twist
        - Left Side
        - Right Size
        - Rest
#### Copying objects
- when copying a pose, flow, or session
    - the ownerId is belongs to the user copying the object
    - the originalId belongs to the object being copied
    - the rest of the properties are copied directly from the original object
- when the original object or copied object changes, the copied object is marked out of sync
- when a copied object is out of sync
    - the owner of the copied object is shown a warning message on hover over a warning icon
    - the owner of the copied object may take one of the following actions:
        - all roles may update the copied object to match the original object
        - Instructors and Teachers may create a new copy of the out of sync copied object
            - the copy behavior is the same behavior described above
#### Poses
- a pose is specific physical posture designed to improve flexibility, strength, balance, and overall well-being.
- poses have the following properties:
    - sanskritName [optional]
    - duration
#### Flows
- a flow is a (short) ordered sequence of poses.
    - flow_poses link child poses to parent flows.
    - flow_poses are sub classes of poses with all of the same properties.
    - flow_poses have the following additional properties:
        - poseId
        - flowId
        - sessionId [optional]
        - orderIndex
        - inSync
    - a flow_pose's poseId belongs to the flow_pose's "linked pose"
    - a flow_pose's originalId belongs to the linked_pose's "original pose"
    - a flow_pose's ownerId belongs to the user creating the flow_pose's creator
    - when a flow_pose is created, it is initialized as a copy of the linked pose with extra properties
        - this allows users to maintain the `flow_pose` data if the linked pose changes
        - the exception is the ownerId which must be updated to the userId creating the flow_pose, not the copied ownerId
    - if a flow_pose has a sessionId, that means it belongs to a flow that belongs to a session
        - the combination of the flowId and sessionId point to a unique session_flow
    - when a flow_pose or its linked pose changes, the flow_pose is marked out of sync
    - when a flow_pose is out of sync the owner of the flow_pose is shown a warning message on hover over a warning icon
        - all roles may update the flow_pose to match the linked pose if they own the flow_pose
        - Instructors and Teachers may create a copy of the out of sync flow_pose as a new pose
            - when copying the flow_pose to a new pose
                - the new pose's ownerId is copied from the flow_pose ownerId
                - the flow_pose's poseId is updated to the new pose's id
                - the rest of the properties on the new pose are copied directly from the flow_pose
                    - this excludes poseId, flowId, sessionId, orderIndex, and inSync
#### Sessions
- a session is an ordered sequence of poses or flows.
    - session_flows link child flows to parent sessions.
        - session_flows are sub classes of flows with all of the same properties.
        - session_flows have the following additional properties:
            - flowId
            - sessionId
            - orderIndex
            - inSync
        - session_flows behave like flow_poses
            - session_flow creation behaves like flow_pose creation
                - generally replace "flow" from flow_pose with "session" and "pose" from flow_pose with "flow"
            - session_flow linked flow out of sync behavior behaves like flow_pose linked pose out of sync behavior
    - session_poses link child poses to parent sessions.
        - session_poses are sub classes of poses with all of the same properties.
        - session_poses have the following additional properties:
            - poseId
            - sessionId
            - orderIndex
            - inSync
        - session_poses behave like flow_poses
            - session_pose creation behaves like flow_pose creation
            - session_pose linked pose out of sync behavior behaves like flow_pose linked pose out of sync behavior

### **Future Enhancements**

*   **Progress Tracking:** To improve user engagement and provide value, a future version of the app should include a tracking component. This would allow users to monitor their progress over time, view session completion history, and visualize trends in workout difficulty and frequency. This aligns with popular features in modern health, wellness, and exercise applications.

### **Admin functionality**
- admin accounts create, update, and delete poses, flows, and sessions in the prebuilt readonly library.
- admin accounts may impersonate any permanent user account.

### **Technical Stack**

*   **Framework:** [Flutter](https://github.com/flutter/flutter) - An open source framework for building beautiful, natively compiled, multi-platform applications from a single codebase.
*   **Language:** [Dart](https://dart.dev/) - An approachable, portable, and productive language for high-quality apps on any platform.
*   **Backend:** [Firebase](https://firebase.google.com/docs/reference) - A platform designed to support you throughout your app development lifecycle.
*   **Navigation:** `go_router`
*   **Data Models:** [Freezed](https://github.com/rrousselGit/freezed) - A code generator for data classes, tagged unions, nested classes and cloning
*   **Architecture:** A service-based architecture separating UI (`screens`), business logic (`services`), and data structures (`models`).
*   **Local Development:** [Firebase Emulator Suite](https://firebase.google.com/docs/emulator-suite) - A set of advanced tools for developers looking to build and test apps locally using Firebase products like Firestore.

### **Assets (images, videos, seed data)**
TODO: determine which assets are required

### **Development Process**
- **Test-Driven Development (TDD):** Each user story will be validated by a comprehensive suite of tests. No user story is considered complete until all associated tests are passing.q
- **Continuous Integration:** All pull requests targeting the `main` branch will be automatically validated by a GitHub Actions workflow that runs linter checks and a full suite of integration tests against a live Firebase Emulator.
- **Continuous Deployment:** When a pull request is merged into the `main` branch, the application will be automatically deployed to production.
- **Sprint-Based Delivery:** The project will be developed in sprints. At the end of each sprint, the completed and tested features will be deployed. No new sprint will begin until the previous sprint's work is deployed.