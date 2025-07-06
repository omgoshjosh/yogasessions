import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yogasessions/models/poses/yoga_pose.dart';
import 'package:yogasessions/services/firestore_service.dart';

class FeaturedPosesScreen extends StatelessWidget {
  const FeaturedPosesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Featured Poses', key: Key('featured_poses_screen_title')),
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
      body: StreamBuilder<List<YogaPose>>(
        stream: firestoreService.getCollection<YogaPose>(
          path: 'yoga_poses',
          builder: (data, documentId) => YogaPose.fromJson(data).copyWith(id: documentId),
          queryBuilder: (query) => query.where('isPublished', isEqualTo: true),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No featured poses found.'));
          }

          final poses = snapshot.data!;
          return ListView.builder(
            itemCount: poses.length,
            itemBuilder: (context, index) {
              final pose = poses[index];
              return ListTile(
                title: Text(pose.name ?? 'Unnamed Pose'),
                subtitle: Text(pose.description ?? ''),
                onTap: () => context.go('/pose/${pose.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
