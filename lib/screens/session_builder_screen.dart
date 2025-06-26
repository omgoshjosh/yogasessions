import 'package:flutter/material.dart';

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
      ),
      body: Center(
        child: Text('Session Builder Placeholder (ID: ${widget.sessionId ?? 'New'})'),
      ),
    );
  }
}