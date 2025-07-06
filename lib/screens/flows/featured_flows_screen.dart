import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yogasessions/models/flows/yoga_flow.dart';
import 'package:yogasessions/services/firestore_service.dart';

class FeaturedFlowsScreen extends StatelessWidget {
  const FeaturedFlowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Featured Flows'),
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
      body: StreamBuilder<List<YogaFlow>>(
        stream: firestoreService.getCollection<YogaFlow>(
          path: 'yoga_flows',
          builder: (data, documentId) => YogaFlow.fromJson(data).copyWith(id: documentId),
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
            return const Center(child: Text('No featured flows found.'));
          }

          final flows = snapshot.data!;
          return ListView.builder(
            itemCount: flows.length,
            itemBuilder: (context, index) {
              final flow = flows[index];
              return ListTile(
                title: Text(flow.name ?? 'Unnamed Flow'),
                subtitle: Text(flow.description ?? ''),
                onTap: () => context.go('/flow/${flow.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
