import 'package:flutter/material.dart';

class PoseDetailScreen extends StatelessWidget {
  final String? poseId;
  const PoseDetailScreen({super.key, this.poseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pose Detail (ID: ${poseId ?? 'N/A'})')),
      body: Center(child: Text('Pose Detail Screen Content for ID: ${poseId ?? 'N/A'}')),
    );
  }
}
