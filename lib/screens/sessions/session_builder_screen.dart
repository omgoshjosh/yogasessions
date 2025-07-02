import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SessionBuilderScreen extends StatefulWidget {
  final String? sessionId;
  const SessionBuilderScreen({super.key, this.sessionId});

  @override
  State<SessionBuilderScreen> createState() => _SessionBuilderScreenState();
}

class _SessionBuilderScreenState extends State<SessionBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sessionId == null ? 'Create Session' : 'Edit Session'),
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
        child: Text('Session Builder Placeholder (ID: ${widget.sessionId ?? 'New'})'),
      ),
    );
  }
}