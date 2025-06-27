import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yogasessions/screens/home_screen.dart';
import 'package:yogasessions/screens/featured_sessions_screen.dart';
import 'package:yogasessions/screens/saved_sessions_screen.dart';
import 'package:yogasessions/screens/session_detail_screen.dart';
import 'package:yogasessions/screens/session_builder_screen.dart';
import 'package:yogasessions/screens/session_player_screen.dart';
import 'package:yogasessions/screens/featured_poses_screen.dart';
import 'package:yogasessions/screens/custom_poses_screen.dart';
import 'package:yogasessions/screens/saved_poses_screen.dart';
import 'package:yogasessions/screens/pose_detail_screen.dart';
import 'package:yogasessions/screens/pose_builder_screen.dart';
import 'package:yogasessions/screens/pose_library_screen.dart';
import 'package:yogasessions/screens/flow_detail_screen.dart';
import 'package:yogasessions/screens/flow_builder_screen.dart';
import 'package:yogasessions/screens/settings_screen.dart';
import 'package:yogasessions/screens/profile_screen.dart';
import 'package:yogasessions/screens/login_screen.dart';
import 'package:yogasessions/screens/signup_screen.dart';
import 'package:yogasessions/screens/onboarding_screen.dart';
import 'package:yogasessions/screens/about_screen.dart';
import 'package:yogasessions/screens/sessions_list_screen.dart';


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
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/featured-sessions',
      builder: (context, state) => const FeaturedSessionsScreen(),
    ),
    GoRoute(
      path: '/saved-sessions',
      builder: (context, state) => const SavedSessionsScreen(),
    ),
    GoRoute(
      path: '/sessions-list',
      builder: (context, state) => const SessionsListScreen(),
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
    GoRoute(
      path: '/featured-poses',
      builder: (context, state) => const FeaturedPosesScreen(),
    ),
    GoRoute(
      path: '/custom-poses',
      builder: (context, state) => const CustomPosesScreen(),
    ),
    GoRoute(
      path: '/saved-poses',
      builder: (context, state) => const SavedPosesScreen(),
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
    GoRoute(
      path: '/flow/:id',
      builder: (context, state) =>
          FlowDetailScreen(flowId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/flow-builder',
      builder: (context, state) => const FlowBuilderScreen(),
    ),
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
