import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PublicHomeScreen extends StatelessWidget {
  const PublicHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yoga Sessions', key: Key('public_home_screen_title')),
        actions: [
          TextButton(
            key: const Key('login_button'),
            onPressed: () => context.go('/login'),
            child: const Text('Login'),
          ),
          TextButton(
            key: const Key('create_account_button'),
            onPressed: () => context.go('/signup'),
            child: const Text('Create Account'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              key: const Key('featured_poses_button'),
              onPressed: () => context.go('/poses/featured'),
              child: const Text('Browse Poses'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              key: const Key('featured_flows_button'),
              onPressed: () => context.go('/flows/featured'),
              child: const Text('Browse Flows'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              key: const Key('featured_sessions_button'),
              onPressed: () => context.go('/sessions/featured'),
              child: const Text('Browse Sessions'),
            ),
          ],
        ),
      ),
    );
  }
}
