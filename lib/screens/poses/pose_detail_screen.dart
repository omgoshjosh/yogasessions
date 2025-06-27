import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PoseDetailScreen extends StatelessWidget {
  final String poseId;
  const PoseDetailScreen({super.key, required this.poseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pose Details: $poseId'),
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
      body: Center(child: Text('PoseDetailScreen for $poseId')),
    );
  }
}
