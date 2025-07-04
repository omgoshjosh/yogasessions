
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yogasessions/integration_test/test_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package.firebase_auth/firebase_auth.dart';

// Renamed from HomeScreen to AdminScreen
class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Updated title for clarity
        title: const Text('Admin Panel'),
        backgroundColor: Colors.red[700],
      ),
      body: ListView(
        children: <Widget>[
          // New button to trigger the database seeding
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.data_usage),
              label: const Text('Seed Database'),
              onPressed: () async {
                final helpers = TestHelpers(FirebaseFirestore.instance, FirebaseAuth.instance);
                await helpers.seedData();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Database has been seeded.')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
          const Divider(),
          const ListTile(title: Text('Authentication')),
          ListTile(
            title: const Text('Login'),
            subtitle: const Text('/login'),
            onTap: () => context.go('/login'),
          ),
          ListTile(
            title: const Text('Signup'),
            subtitle: const Text('/signup'),
            onTap: () => context.go('/signup'),
          ),
          ListTile(
            title: const Text('Onboarding'),
            subtitle: const Text('/onboarding'),
            onTap: () => context.go('/onboarding'),
          ),
          const Divider(),
          const ListTile(title: Text('Sessions')),
          ListTile(
            title: const Text('Featured Sessions'),
            subtitle: const Text('/sessions/featured'),
            onTap: () => context.go('/sessions/featured'),
          ),
          ListTile(
            title: const Text('Saved Sessions'),
            subtitle: const Text('/sessions/saved'),
            onTap: () => context.go('/sessions/saved'),
          ),
          ListTile(
            title: const Text('Custom Sessions'),
            subtitle: const Text('/sessions/custom'),
            onTap: () => context.go('/sessions/custom'),
          ),
          ListTile(
            title: const Text('Session Detail'),
            subtitle: const Text('/session/1'),
            onTap: () => context.go('/session/1'),
          ),
          ListTile(
            title: const Text('Session Builder'),
            subtitle: const Text('/session-builder'),
            onTap: () => context.go('/session-builder'),
          ),
          ListTile(
            title: const Text('Session Player'),
            subtitle: const Text('/session-player/1'),
            onTap: () => context.go('/session-player/1'),
          ),
          const Divider(),
          const ListTile(title: Text('Flows')),
          ListTile(
            title: const Text('Featured Flows'),
            subtitle: const Text('/flows/featured'),
            onTap: () => context.go('/flows/featured'),
          ),
          ListTile(
            title: const Text('Saved Flows'),
            subtitle: const Text('/flows/saved'),
            onTap: () => context.go('/flows/saved'),
          ),
          ListTile(
            title: const Text('Custom Flows'),
            subtitle: const Text('/flows/custom'),
            onTap: () => context.go('/flows/custom'),
          ),
          ListTile(
            title: const Text('Flow Detail'),
            subtitle: const Text('/flow/1'),
            onTap: () => context.go('/flow/1'),
          ),
          ListTile(
            title: const Text('Flow Builder'),
            subtitle: const Text('/flow-builder'),
            onTap: () => context.go('/flow-builder'),
          ),
          const Divider(),
          const ListTile(title: Text('Poses')),
          ListTile(
            title: const Text('Featured Poses'),
            subtitle: const Text('/poses/featured'),
            onTap: () => context.go('/poses/featured'),
          ),
          ListTile(
            title: const Text('Saved Poses'),
            subtitle: const Text('/poses/saved'),
            onTap: () => context.go('/poses/saved'),
          ),
          ListTile(
            title: const Text('Custom Poses'),
            subtitle: const Text('/poses/custom'),
            onTap: () => context.go('/poses/custom'),
          ),
          ListTile(
            title: const Text('Pose Library'),
            subtitle: const Text('/pose-library'),
            onTap: () => context.go('/pose-library'),
          ),
          ListTile(
            title: const Text('Pose Detail'),
            subtitle: const Text('/pose/1'),
            onTap: () => context.go('/pose/1'),
          ),
          ListTile(
            title: const Text('Pose Builder'),
            subtitle: const Text('/pose-builder'),
            onTap: () => context.go('/pose-builder'),
          ),
          const Divider(),
          const ListTile(title: Text('Other')),
          ListTile(
            title: const Text('Profile'),
            subtitle: const Text('/profile'),
            onTap: () => context.go('/profile'),
          ),
          ListTile(
            title: const Text('Settings'),
            subtitle: const Text('/settings'),
            onTap: () => context.go('/settings'),
          ),
          ListTile(
            title: const Text('About'),
            subtitle: const Text('/about'),
            onTap: () => context.go('/about'),
          ),
        ],
      ),
    );
  }
}
