
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yogasessions/screens/public_home_screen.dart'; // Import the new screen
import 'package:yogasessions/screens/admin_screen.dart'; // Rename for clarity
import 'package:yogasessions/screens/sessions/featured_sessions_screen.dart';
import 'package:yogasessions/screens/sessions/saved_sessions_screen.dart';
import 'package:yogasessions/screens/sessions/custom_sessions_screen.dart';
import 'package:yogasessions/screens/sessions/session_detail_screen.dart';
import 'package:yogasessions/screens/sessions/session_builder_screen.dart';
import 'package:yogasessions/screens/sessions/session_player_screen.dart';
import 'package:yogasessions/screens/poses/featured_poses_screen.dart';
import 'package:yogasessions/screens/poses/custom_poses_screen.dart';
import 'package:yogasessions/screens/poses/saved_poses_screen.dart';
import 'package:yogasessions/screens/poses/pose_detail_screen.dart';
import 'package:yogasessions/screens/poses/pose_builder_screen.dart';
import 'package:yogasessions/screens/poses/pose_library_screen.dart';
import 'package:yogasessions/screens/flows/featured_flows_screen.dart';
import 'package:yogasessions/screens/flows/saved_flows_screen.dart';
import 'package:yogasessions/screens/flows/custom_flows_screen.dart';
import 'package:yogasessions/screens/flows/flow_detail_screen.dart';
import 'package:yogasessions/screens/flows/flow_builder_screen.dart';
import 'package:yogasessions/screens/settings_screen.dart';
import 'package:yogasessions/screens/profile_screen.dart';
import 'package:yogasessions/screens/login_screen.dart';
import 'package:yogasessions/screens/signup_screen.dart';
import 'package:yogasessions/screens/onboarding_screen.dart';
import 'package:yogasessions/screens/about_screen.dart';

void main() {
  runApp(const YogaSessionsApp());
}

class YogaSessionsApp extends StatelessWidget {
  const YogaSessionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Yoga Sessions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PublicHomeScreen(), // New default home
    ),
    GoRoute(
      path: '/admin', // New route for the admin panel
      builder: (context, state) => const AdminScreen(),
    ),
    // SESSIONS
    GoRoute(
      path: '/sessions/featured',
      builder: (context, state) => const FeaturedSessionsScreen(),
    ),
    GoRoute(
      path: '/sessions/saved',
      builder: (context, state) => const SavedSessionsScreen(),
    ),
    GoRoute(
      path: '/sessions/custom',
      builder: (context, state) => const CustomSessionsScreen(),
    ),
    GoRoute(
      path: '/session/:id',
      builder: (context, state) =>
          SessionDetailScreen(sessionId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/session-builder',
      builder: (context, state) => const SessionBuilderScreen(),
    ),
    GoRoute(
      path: '/session-player/:id',
      builder: (context, state) =>
          SessionPlayerScreen(sessionId: state.pathParameters['id']!),
    ),
    // FLOWS
    GoRoute(
      path: '/flows/featured',
      builder: (context, state) => const FeaturedFlowsScreen(),
    ),
    GoRoute(
      path: '/flows/saved',
      builder: (context, state) => const SavedFlowsScreen(),
    ),
    GoRoute(
      path: '/flows/custom',
      builder: (context, state) => const CustomFlowsScreen(),
    ),
    GoRoute(
      path: '/flow/:id',
      builder: (context, state) =>
          FlowDetailScreen(flowId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/flow-builder',
      builder: (context, state) => const FlowBuilderScreen(),
    ),
    // POSES
    GoRoute(
      path: '/poses/featured',
      builder: (context, state) => const FeaturedPosesScreen(),
    ),
    GoRoute(
      path: '/poses/saved',
      builder: (context, state) => const SavedPosesScreen(),
    ),
    GoRoute(
      path: '/poses/custom',
      builder: (context, state) => const CustomPosesScreen(),
    ),
    GoRoute(
      path: '/pose-library',
      builder: (context, state) => const PoseLibraryScreen(),
    ),
    GoRoute(
      path: '/pose/:id',
      builder: (context, state) =>
          PoseDetailScreen(poseId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/pose-builder',
      builder: (context, state) => const PoseBuilderScreen(),
    ),
    // OTHER
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
  ],
);
