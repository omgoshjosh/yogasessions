import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yogasessions/models/flows/yoga_flow.dart';
import 'package:yogasessions/models/flows/yoga_flow_pose.dart';
import 'package:yogasessions/services/firestore_service.dart';

class FlowDetailScreen extends StatefulWidget {
  final String flowId;
  const FlowDetailScreen({super.key, required this.flowId});

  @override
  State<FlowDetailScreen> createState() => _FlowDetailScreenState();
}

class _FlowDetailScreenState extends State<FlowDetailScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flow Details'),
      ),
      body: StreamBuilder<YogaFlow?>(
        stream: _firestoreService.getDocument(
          path: 'yoga_flows',
          id: widget.flowId,
          builder: (data, documentId) =>
              YogaFlow.fromJson(data).copyWith(id: documentId),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Flow not found.'));
          }

          final flow = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flow.name ?? 'Unnamed Flow',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(flow.description ?? ''),
                const SizedBox(height: 24),
                Text(
                  'Poses in this Flow',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                _buildPosesList(flow.id!),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPosesList(String flowId) {
    return StreamBuilder<List<YogaFlowPose>>(
      stream: _firestoreService.getCollection(
        path: 'yoga_flows/$flowId/yoga_flow_poses',
        builder: (data, documentId) =>
            YogaFlowPose.fromJson(data).copyWith(id: documentId),
        queryBuilder: (query) => query.orderBy('orderIndex'),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading poses: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No poses found in this flow.'));
        }

        final poses = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: poses.length,
          itemBuilder: (context, index) {
            final pose = poses[index];
            return ListTile(
              title: Text(pose.name ?? 'Unnamed Pose'),
              subtitle: Text(pose.description ?? ''),
              onTap: () => context.go('/pose/${pose.poseId}'),
            );
          },
        );
      },
    );
  }
}
