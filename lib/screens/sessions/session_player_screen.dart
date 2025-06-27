import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SessionPlayerScreen extends StatefulWidget {
  final String sessionId;

  const SessionPlayerScreen({super.key, required this.sessionId});

  @override
  State<SessionPlayerScreen> createState() => _SessionPlayerScreenState();
}

class _SessionPlayerScreenState extends State<SessionPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playing Session: ${widget.sessionId}'),
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
        child: Text('Player for session: ${widget.sessionId}'),
      ),
    );
  }
}
