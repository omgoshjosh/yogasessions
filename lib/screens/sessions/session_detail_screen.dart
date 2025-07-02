import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SessionDetailScreen extends StatelessWidget {
  final String sessionId;

  const SessionDetailScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Session Details: $sessionId'),
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
      body: Center(
        child: Text('Details for session: $sessionId'),
      ),
    );
  }
}
