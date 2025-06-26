import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold can't be const if AppBar isn't or body isn't
      appBar: AppBar(
        title: const Text('Settings'), // Title can still be const
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
      body: const Center(child: Text('Settings Screen Placeholder')),
    );
  }
}
