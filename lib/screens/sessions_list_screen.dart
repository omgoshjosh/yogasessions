import 'package:flutter/material.dart';

class SessionsListScreen extends StatelessWidget {
  const SessionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yoga Sessions')),
      body: Center(
        child: Text('Sessions List Screen'),
      ),
    );
  }
}
