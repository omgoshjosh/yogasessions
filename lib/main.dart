import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Existing Screens
import 'package:yogasessions/screens/auth_screen.dart';
import 'package:yogasessions/screens/pose_library_screen.dart'; // Will be replaced by FeaturedPosesScreen for routing
import 'package:yogasessions/screens/session_builder_screen.dart';
import 'package:yogasessions/screens/session_detail_screen.dart';
import 'package:yogasessions/screens/session_player_screen.dart';
import 'package:yogasessions/screens/sessions_list_screen.dart'; // Will be replaced by FeaturedSessionsScreen for routing

// New Placeholder Screens
import 'package:yogasessions/screens/home_screen.dart';
import 'package:yogasessions/screens/settings_screen.dart';
import 'package:yogasessions/screens/profile_screen.dart';
import 'package:yogasessions/screens/featured_sessions_screen.dart';
import 'package:yogasessions/screens/saved_sessions_screen.dart';
import 'package:yogasessions/screens/custom_sessions_screen.dart';
import 'package:yogasessions/screens/featured_flows_screen.dart';
import 'package:yogasessions/screens/saved_flows_screen.dart';
import 'package:yogasessions/screens/custom_flows_screen.dart';
import 'package:yogasessions/screens/flow_builder_screen.dart';
import 'package:yogasessions/screens/flow_detail_screen.dart';
import 'package:yogasessions/screens/featured_poses_screen.dart';
import 'package:yogasessions/screens/saved_poses_screen.dart';
import 'package:yogasessions/screens/custom_poses_screen.dart';
import 'package:yogasessions/screens/pose_builder_screen.dart';
import 'package:yogasessions/screens/pose_detail_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyAIGa2Gt10ah8X2G7KjKmaimvFuPtB043g',
        appId: '1:533486029957:android:463742000bcf553079adec',
        messagingSenderId: '533486029957',
        projectId: 'yogasessions2',
    )
  );
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 7979);
  runApp(const MyApp());
}

// GoRouter configuration
final GoRouter _router = GoRouter(
  initialLocation: '/', // Changed initial location
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/auth',
      builder: (BuildContext context, GoRouterState state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (BuildContext context, GoRouterState state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/sessions',
      redirect: (_, __) => '/sessions/featured', // Redirect base /sessions to featured
    ),
    GoRoute(
      path: '/sessions/featured',
      builder: (BuildContext context, GoRouterState state) => const FeaturedSessionsScreen(), // Or SessionsListScreen()
      routes: <RouteBase>[
        GoRoute(
          path: 'new', //  -> /sessions/featured/new - consider if this should be /sessions/new
          builder: (BuildContext context, GoRouterState state) => const SessionBuilderScreen(),
        ),
        GoRoute(
          path: ':sessionId/detail', // -> /sessions/featured/:sessionId/detail
          builder: (BuildContext context, GoRouterState state) {
            final sessionId = state.pathParameters['sessionId']!;
            return SessionDetailScreen(sessionId: sessionId);
          },
        ),
        GoRoute(
          path: ':sessionId/edit', // -> /sessions/featured/:sessionId/edit
          builder: (BuildContext context, GoRouterState state) {
            final sessionId = state.pathParameters['sessionId']!;
            // Potentially pass sessionId to SessionBuilderScreen if it supports loading existing session
            return SessionBuilderScreen(sessionId: sessionId);
          },
        ),
        GoRoute(
          path: ':sessionId/player', // -> /sessions/featured/:sessionId/player
          builder: (BuildContext context, GoRouterState state) {
            final sessionId = state.pathParameters['sessionId']!;
            return SessionPlayerScreen(sessionId: sessionId);
          },
        ),
      ]
    ),
    GoRoute(
      path: '/sessions/saved',
      builder: (BuildContext context, GoRouterState state) => const SavedSessionsScreen(),
       routes: <RouteBase>[ // Assuming similar sub-routes for saved and custom
        GoRoute(
          path: ':sessionId/detail',
          builder: (BuildContext context, GoRouterState state) {
            final sessionId = state.pathParameters['sessionId']!;
            return SessionDetailScreen(sessionId: sessionId);
          },
        ),
        GoRoute(
          path: ':sessionId/edit',
          builder: (BuildContext context, GoRouterState state) {
            final sessionId = state.pathParameters['sessionId']!;
            return SessionBuilderScreen(sessionId: sessionId);
          },
        ),
        GoRoute(
          path: ':sessionId/player',
          builder: (BuildContext context, GoRouterState state) {
            final sessionId = state.pathParameters['sessionId']!;
            return SessionPlayerScreen(sessionId: sessionId);
          },
        ),
      ]
    ),
    GoRoute(
      path: '/sessions/custom',
      builder: (BuildContext context, GoRouterState state) => const CustomSessionsScreen(),
       routes: <RouteBase>[
         GoRoute(
          path: 'new', // For creating a new custom session directly
          builder: (BuildContext context, GoRouterState state) => const SessionBuilderScreen(),
        ),
        GoRoute(
          path: ':sessionId/detail',
          builder: (BuildContext context, GoRouterState state) {
            final sessionId = state.pathParameters['sessionId']!;
            return SessionDetailScreen(sessionId: sessionId);
          },
        ),
        GoRoute(
          path: ':sessionId/edit',
          builder: (BuildContext context, GoRouterState state) {
            final sessionId = state.pathParameters['sessionId']!;
            return SessionBuilderScreen(sessionId: sessionId);
          },
        ),
        GoRoute(
          path: ':sessionId/player',
          builder: (BuildContext context, GoRouterState state) {
            final sessionId = state.pathParameters['sessionId']!;
            return SessionPlayerScreen(sessionId: sessionId);
          },
        ),
      ]
    ),
    // Simplified '/sessions/new' at the top level for creating any new session.
    // Alternatively, 'new' could be a sub-route of /sessions/custom, etc.
     GoRoute(
      path: '/sessions/new',
      builder: (BuildContext context, GoRouterState state) => const SessionBuilderScreen(),
    ),


    // Flows
    GoRoute(
      path: '/flows',
      redirect: (_, __) => '/flows/featured',
    ),
    GoRoute(
      path: '/flows/featured',
      builder: (BuildContext context, GoRouterState state) => const FeaturedFlowsScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: 'new',
          builder: (BuildContext context, GoRouterState state) => const FlowBuilderScreen(),
        ),
        GoRoute(
          path: ':flowId/detail',
          builder: (BuildContext context, GoRouterState state) {
            final flowId = state.pathParameters['flowId']!;
            return FlowDetailScreen(flowId: flowId);
          },
        ),
        GoRoute(
          path: ':flowId/edit',
          builder: (BuildContext context, GoRouterState state) {
            final flowId = state.pathParameters['flowId']!;
            return FlowBuilderScreen(flowId: flowId);
          },
        ),
      ]
    ),
    GoRoute(
      path: '/flows/saved',
      builder: (BuildContext context, GoRouterState state) => const SavedFlowsScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: ':flowId/detail',
          builder: (BuildContext context, GoRouterState state) {
            final flowId = state.pathParameters['flowId']!;
            return FlowDetailScreen(flowId: flowId);
          },
        ),
        GoRoute(
          path: ':flowId/edit',
          builder: (BuildContext context, GoRouterState state) {
            final flowId = state.pathParameters['flowId']!;
            return FlowBuilderScreen(flowId: flowId);
          },
        ),
      ]
    ),
    GoRoute(
      path: '/flows/custom',
      builder: (BuildContext context, GoRouterState state) => const CustomFlowsScreen(),
      routes: <RouteBase>[
         GoRoute(
          path: 'new',
          builder: (BuildContext context, GoRouterState state) => const FlowBuilderScreen(),
        ),
        GoRoute(
          path: ':flowId/detail',
          builder: (BuildContext context, GoRouterState state) {
            final flowId = state.pathParameters['flowId']!;
            return FlowDetailScreen(flowId: flowId);
          },
        ),
        GoRoute(
          path: ':flowId/edit',
          builder: (BuildContext context, GoRouterState state) {
            final flowId = state.pathParameters['flowId']!;
            return FlowBuilderScreen(flowId: flowId);
          },
        ),
      ]
    ),
     GoRoute(
      path: '/flows/new', // Top-level new route
      builder: (BuildContext context, GoRouterState state) => const FlowBuilderScreen(),
    ),

    // Poses
    GoRoute(
      path: '/poses',
      redirect: (_, __) => '/poses/featured',
    ),
    GoRoute(
      path: '/poses/featured',
      builder: (BuildContext context, GoRouterState state) => const FeaturedPosesScreen(), // Or PoseLibraryScreen()
      routes: <RouteBase>[
        GoRoute(
          path: 'new',
          builder: (BuildContext context, GoRouterState state) => const PoseBuilderScreen(),
        ),
        GoRoute(
          path: ':poseId/detail',
          builder: (BuildContext context, GoRouterState state) {
            final poseId = state.pathParameters['poseId']!;
            return PoseDetailScreen(poseId: poseId);
          },
        ),
        GoRoute(
          path: ':poseId/edit',
          builder: (BuildContext context, GoRouterState state) {
            final poseId = state.pathParameters['poseId']!;
            return PoseBuilderScreen(poseId: poseId);
          },
        ),
      ]
    ),
    GoRoute(
      path: '/poses/saved',
      builder: (BuildContext context, GoRouterState state) => const SavedPosesScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: ':poseId/detail',
          builder: (BuildContext context, GoRouterState state) {
            final poseId = state.pathParameters['poseId']!;
            return PoseDetailScreen(poseId: poseId);
          },
        ),
        GoRoute(
          path: ':poseId/edit',
          builder: (BuildContext context, GoRouterState state) {
            final poseId = state.pathParameters['poseId']!;
            return PoseBuilderScreen(poseId: poseId);
          },
        ),
      ]
    ),
    GoRoute(
      path: '/poses/custom',
      builder: (BuildContext context, GoRouterState state) => const CustomPosesScreen(),
       routes: <RouteBase>[
         GoRoute(
          path: 'new',
          builder: (BuildContext context, GoRouterState state) => const PoseBuilderScreen(),
        ),
        GoRoute(
          path: ':poseId/detail',
          builder: (BuildContext context, GoRouterState state) {
            final poseId = state.pathParameters['poseId']!;
            return PoseDetailScreen(poseId: poseId);
          },
        ),
        GoRoute(
          path: ':poseId/edit',
          builder: (BuildContext context, GoRouterState state) {
            final poseId = state.pathParameters['poseId']!;
            return PoseBuilderScreen(poseId: poseId);
          },
        ),
      ]
    ),
    GoRoute(
      path: '/poses/new', // Top-level new route
      builder: (BuildContext context, GoRouterState state) => const PoseBuilderScreen(),
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
