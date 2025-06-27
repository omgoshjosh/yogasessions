import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlowDetailScreen extends StatelessWidget {
  final String? flowId;
  const FlowDetailScreen({super.key, this.flowId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flow Detail (ID: ${flowId ?? 'N/A'})'),
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
      body: Center(child: Text('Flow Detail Screen Content for ID: ${flowId ?? 'N/A'}')),
    );
  }
}
