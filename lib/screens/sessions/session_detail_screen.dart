import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yogasessions/models/sessions/yoga_session.dart';
import 'package:yogasessions/models/sessions/yoga_session_flow.dart';
import 'package:yogasessions/models/sessions/yoga_session_pose.dart';
import 'package:yogasessions/services/firestore_service.dart';

class SessionDetailScreen extends StatefulWidget {
  final String sessionId;
  const SessionDetailScreen({super.key, required this.sessionId});

  @override
  State<SessionDetailScreen> createState() => _SessionDetailScreenState();
}

class _SessionDetailScreenState extends State<SessionDetailScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Details'),
      ),
      body: StreamBuilder<YogaSession?>(
        stream: _firestoreService.getDocument(
          path: 'yoga_sessions',
          id: widget.sessionId,
          builder: (data, documentId) =>
              YogaSession.fromJson(data).copyWith(id: documentId),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Session not found.'));
          }

          final session = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  session.name ?? 'Unnamed Session',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(session.description ?? ''),
                const SizedBox(height: 24),
                Text(
                  'Flows in this Session',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                _buildFlowsList(session.id!),
                const SizedBox(height: 24),
                Text(
                  'Poses in this Session',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                _buildPosesList(session.id!),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFlowsList(String sessionId) {
    return StreamBuilder<List<YogaSessionFlow>>(
      stream: _firestoreService.getCollection(
        path: 'yoga_sessions/$sessionId/yoga_session_flows',
        builder: (data, documentId) =>
            YogaSessionFlow.fromJson(data).copyWith(id: documentId),
        queryBuilder: (query) => query.orderBy('orderIndex'),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading flows: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No flows found in this session.'));
        }

        final flows = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: flows.length,
          itemBuilder: (context, index) {
            final flow = flows[index];
            return ListTile(
              title: Text(flow.name ?? 'Unnamed Flow'),
              subtitle: Text(flow.description ?? ''),
              onTap: () => context.go('/flow/${flow.flowId}'),
            );
          },
        );
      },
    );
  }

  Widget _buildPosesList(String sessionId) {
    return StreamBuilder<List<YogaSessionPose>>(
      stream: _firestoreService.getCollection(
        path: 'yoga_sessions/$sessionId/yoga_session_poses',
        builder: (data, documentId) =>
            YogaSessionPose.fromJson(data).copyWith(id: documentId),
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
          return const Center(child: Text('No poses found in this session.'));
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
