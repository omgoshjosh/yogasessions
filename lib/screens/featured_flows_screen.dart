import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class FeaturedFlowsScreen extends StatelessWidget {
  const FeaturedFlowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Featured Flows'),
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
      body: const Center(child: Text('FeaturedFlowsScreen Placeholder')),
    );
  }
}