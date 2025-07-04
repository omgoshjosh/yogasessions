
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PublicHomeScreen extends StatelessWidget {
  const PublicHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The test looks for this specific key to verify it's on the correct screen.
        title: const Text('Featured Sessions', key: Key('public_home_screen_title')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // The test looks for this specific key to tap it.
              key: const Key('featured_poses_button'),
              onPressed: () {
                // Navigate to the screen that shows the list of all poses.
                context.go('/poses/featured');
              },
              child: const Text('Browse All Poses'),
            ),
            // We can add buttons for sessions and flows here later.
          ],
        ),
      ),
    );
  }
}
