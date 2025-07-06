import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yogasessions/models/sessions/yoga_session.dart';
import 'package:yogasessions/services/firestore_service.dart';

class FeaturedSessionsScreen extends StatelessWidget {
  const FeaturedSessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Featured Sessions'),
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
      body: StreamBuilder<List<YogaSession>>(
        stream: firestoreService.getCollection<YogaSession>(
          path: 'yoga_sessions',
          builder: (data, documentId) => YogaSession.fromJson(data).copyWith(id: documentId),
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
            return const Center(child: Text('No featured sessions found.'));
          }

          final sessions = snapshot.data!;
          return ListView.builder(
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];
              return ListTile(
                title: Text(session.name ?? 'Unnamed Session'),
                subtitle: Text(session.description ?? ''),
                onTap: () => context.go('/session/${session.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
