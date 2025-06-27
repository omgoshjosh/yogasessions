import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedPosesScreen extends StatelessWidget {
  const FeaturedPosesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The test looks for this specific key to verify it's on the correct screen.
        title: const Text('Featured Poses', key: Key('featured_poses_screen_title')),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Go Home',
            onPressed: () {
              // Navigate to the public home screen, not the admin panel.
              context.go('/');
            },
          ),
        ],
      ),
      // This will be replaced with a list of poses fetched from Firestore.
      body: const Center(child: Text('Featured Poses Placeholder')),
    );
  }
}
