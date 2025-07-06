import 'package:flutter/material.dart';
import 'package:yogasessions/models/poses/yoga_pose.dart';
import 'package:yogasessions/services/firestore_service.dart';

class PoseDetailScreen extends StatefulWidget {
  final String poseId;
  const PoseDetailScreen({super.key, required this.poseId});

  @override
  State<PoseDetailScreen> createState() => _PoseDetailScreenState();
}

class _PoseDetailScreenState extends State<PoseDetailScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pose Details'),
      ),
      body: StreamBuilder<YogaPose?>(
        stream: _firestoreService.getDocument(
          path: 'yoga_poses',
          id: widget.poseId,
          builder: (data, documentId) =>
              YogaPose.fromJson(data).copyWith(id: documentId),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Pose not found.'));
          }

          final pose = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pose.name ?? 'Unnamed Pose',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  pose.sanskritName ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Text(pose.description ?? ''),
              ],
            ),
          );
        },
      ),
    );
  }
}
