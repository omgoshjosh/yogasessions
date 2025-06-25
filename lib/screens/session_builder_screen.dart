import 'package:flutter/material.dart';

class SessionBuilderScreen extends StatefulWidget {
  const SessionBuilderScreen({super.key});

  @override
  State<SessionBuilderScreen> createState() => _SessionBuilderScreenState();
}

class _SessionBuilderScreenState extends State<SessionBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Build Session')),
      body: Center(
        child: Text('Session Builder Screen'),
      ),
    );
  }
}
