import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text('Playing Session: ${widget.sessionId}')),
      body: Center(
        child: Text('Player for session: ${widget.sessionId}'),
      ),
    );
  }
}
