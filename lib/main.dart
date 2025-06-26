import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart'; // Assuming you have this or will generate it
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yogasessions/screens/auth_screen.dart';
import 'package:yogasessions/screens/pose_library_screen.dart';
import 'package:yogasessions/screens/session_builder_screen.dart';
import 'package:yogasessions/screens/session_detail_screen.dart';
import 'package:yogasessions/screens/session_player_screen.dart';
import 'package:yogasessions/screens/sessions_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // It's good practice to initialize Firebase before using its services.
  // If you have a firebase_options.dart file from FlutterFire CLI,
  // you would typically use:
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // For local emulator development without full project setup yet,
  // a placeholder project ID can sometimes work for the SDK to initialize.
  // However, ensure your firebase.json has the correct emulator ports.
  await Firebase.initializeApp(
    // Using a placeholder project ID as you're focusing on emulators.
    // Ensure this doesn't conflict with your actual Firebase project if you have one linked.
    // For a real build, you'd use your actual Firebase project's options.
    options: const FirebaseOptions(
        apiKey: 'AIzaSyAIGa2Gt10ah8X2G7KjKmaimvFuPtB043g', // Required but not used by emulators
        appId: '1:533486029957:android:463742000bcf553079adec', // Required
        messagingSenderId: '533486029957', // Required
        projectId: 'yogasessions2', // Should match what emulators expect or be a consistent dummy
    )
  );

  // Configure Firestore to use the local emulator
  // Make sure this is called after Firebase.initializeApp()
  // and before any Firestore operations.
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 7979);

  runApp(const MyApp());
}

// GoRouter configuration
final GoRouter _router = GoRouter(
  initialLocation: '/sessions',
  routes: <RouteBase>[
    GoRoute(
      path: '/sessions',
      builder: (BuildContext context, GoRouterState state) {
        return const SessionsListScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'detail/:sessionId', // Example: /sessions/detail/123
          builder: (BuildContext context, GoRouterState state) {
            final sessionId = state.pathParameters['sessionId']!;
            return SessionDetailScreen(sessionId: sessionId);
          },
        ),
        GoRoute(
          path: 'player/:sessionId', // Example: /sessions/player/123
          builder: (BuildContext context, GoRouterState state) {
            final sessionId = state.pathParameters['sessionId']!;
            return SessionPlayerScreen(sessionId: sessionId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/auth',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthScreen();
      },
    ),
    GoRoute(
      path: '/build-session',
      builder: (BuildContext context, GoRouterState state) {
        // Optional: pass sessionId if editing an existing session
        // final String? sessionId = state.uri.queryParameters['sessionId'];
        return const SessionBuilderScreen();
      },
    ),
    GoRoute(
      path: '/pose-library',
      builder: (BuildContext context, GoRouterState state) {
        return const PoseLibraryScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Yoga Sessions App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
