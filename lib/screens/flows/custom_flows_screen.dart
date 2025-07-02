import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class CustomFlowsScreen extends StatelessWidget {
  const CustomFlowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Flows'),
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
      body: const Center(child: Text('CustomFlowsScreen Placeholder')),
    );
  }
}
