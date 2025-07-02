import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PoseLibraryScreen extends StatelessWidget {
  const PoseLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pose Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Go Home',
            onPressed: () {
              context.go('/');
            },
          ),
        ],
      ),
      body: const Center(child: Text('Pose Library Screen Placeholder')),
    );
  }
}
