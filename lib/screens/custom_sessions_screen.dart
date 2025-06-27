import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class CustomSessionsScreen extends StatelessWidget {
  const CustomSessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Sessions'),
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
      body: const Center(child: Text('CustomSessionsScreen Placeholder')),
    );
  }
}