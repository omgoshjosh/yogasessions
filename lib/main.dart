import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yogasessions/screens/auth_screen.dart';
import 'package:yogasessions/screens/pose_library_screen.dart';
import 'package:yogasessions/screens/session_builder_screen.dart';
import 'package:yogasessions/screens/session_detail_screen.dart';
import 'package:yogasessions/screens/session_player_screen.dart';
import 'package:yogasessions/screens/sessions_list_screen.dart';

void main() {
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
