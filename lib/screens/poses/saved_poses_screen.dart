import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class SavedPosesScreen extends StatelessWidget {
  const SavedPosesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Poses'),
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
      body: const Center(child: Text('SavedPosesScreen Placeholder')),
    );
  }
}