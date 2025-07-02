import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
      body: const Center(child: Text('Profile Screen Placeholder')),
    );
  }
}
