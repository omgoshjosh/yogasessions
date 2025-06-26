import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold cannot be const if children are not all const
      appBar: AppBar(
        title: const Text('Home Screen'), // AppBar title can be const
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.go('/sessions/featured');
              },
              child: const Text('Featured Sessions'),
            ),
            const SizedBox(height: 20), // Spacer
            ElevatedButton(
              onPressed: () {
                context.go('/flows/featured');
              },
              child: const Text('Featured Flows'),
            ),
            const SizedBox(height: 20), // Spacer
            ElevatedButton(
              onPressed: () {
                context.go('/poses/featured');
              },
              child: const Text('Featured Poses'),
            ),
          ],
        ),
      ),
    );
  }
}
