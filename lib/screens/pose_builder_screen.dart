import 'package:flutter/material.dart';

class PoseBuilderScreen extends StatelessWidget {
  final String? poseId;
  const PoseBuilderScreen({super.key, this.poseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(poseId == null ? 'Create Pose' : 'Edit Pose')),
      body: Center(child: Text('Pose Builder Placeholder (ID: ${poseId ?? 'New'})')),
    );
  }
}
