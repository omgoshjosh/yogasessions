import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:yogasessions/models/yoga_pose.dart'; // Assuming YogaPose is updated

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<DocumentReference> addDocument(String collectionPath, Map<String, dynamic> data) {
    return _db.collection(collectionPath).add(data);
  }

  Future<void> setDocument(String collectionPath, String docId, Map<String, dynamic> data) {
    return _db.collection(collectionPath).doc(docId).set(data);
  }

  Future<void> updateDocument(String collectionPath, String docId, Map<String, dynamic> data) {
    return _db.collection(collectionPath).doc(docId).update(data);
  }

  Future<void> deleteDocument(String collectionPath, String docId) {
    return _db.collection(collectionPath).doc(docId).delete();
  }

  Stream<T?> getDocument<T>({
    required String path,
    required String id,
    required T Function(Map<String, dynamic> data, String documentID) builder,
  }) {
    final reference = _db.collection(path).doc(id);
    return reference.snapshots().map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        return builder(snapshot.data()!, snapshot.id);
      }
      return null;
    });
  }

  Stream<List<T>> getCollection<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentID) builder,
    List<QueryConstraint> Function(Query query)? queryBuilder,
  }) {
    Query query = _db.collection(path);
    if (queryBuilder != null) {
      // This cast might be problematic if QueryConstraint is not directly compatible.
      // Firestore query builders usually chain methods directly.
      // For complex queries, it might be better to construct them directly
      // where this service method is called, or pass more specific parameters.
      query = queryBuilder(query) as Query<Object?>;
    }
    return query.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => builder(doc.data() as Map<String, dynamic>, doc.id)).toList());
  }

  // Updated seeding method for idempotency (checks for existing document by 'name')
  // and uses YogaPose.toMap()
  Future<void> seedYogaPosesFromJson(String jsonAssetPath) async {
    const String collectionName = 'yoga_poses';
    try {
      final String response = await rootBundle.loadString(jsonAssetPath);
      final List<dynamic> data = json.decode(response) as List<dynamic>;

      final collectionRef = _db.collection(collectionName);
      WriteBatch batch = _db.batch();
      int writeCount = 0;
      int skippedCount = 0;

      for (final poseDataJson in data) {
        final Map<String, dynamic> poseDataMap = poseDataJson as Map<String, dynamic>;
        
        // --- Idempotency Check ---
        // Assuming 'name' is unique in your seed data and used for checking.
        // If your seed data has a specific 'id', use that for the check instead.
        final String poseName = poseDataMap['name'] as String;
        final querySnapshot = await collectionRef.where('name', isEqualTo: poseName).limit(1).get();

        if (querySnapshot.docs.isEmpty) {
          // Prepare YogaPose object, ensuring all required fields are present
          // 'creatorUserId' and 'isPublished' should ideally be in your seed JSON.
          // If not, provide defaults here.
          YogaPose pose = YogaPose(
            id: 'temporary-id', // Will be replaced by Firestore doc ID or an ID from JSON
            name: poseName,
            description: poseDataMap['description'] ?? '',
            sanskritName: poseDataMap['sanskritName'],
            imageUrl: poseDataMap['imageUrl'],
            originalId: poseDataMap['originalId'], // Assumes 'originalId' might be in JSON
            creatorUserId: poseDataMap['creatorUserId'] ?? '-1', // Default if not in JSON
            isPublished: poseDataMap['isPublished'] ?? true,   // Default if not in JSON
          );

          DocumentReference docRef;
          // If your JSON has an 'id' field for poses, use it as the document ID
          if (poseDataMap.containsKey('id') && poseDataMap['id'] != null) {
            docRef = collectionRef.doc(poseDataMap['id'] as String);
          } else {
            docRef = collectionRef.doc(); // Firestore auto-generates ID
          }
          batch.set(docRef, pose.toMap()); // Use the toMap method
          writeCount++;
        } else {
          skippedCount++;
        }

        if (writeCount > 0 && writeCount % 400 == 0) { // Commit batch periodically
            await batch.commit();
            batch = _db.batch();
        }
      }
      if (writeCount % 400 != 0 && writeCount > 0) { // Commit any remaining writes
        await batch.commit();
      }
      
      if (skippedCount > 0) {
        print('$collectionName: Skipped $skippedCount existing items.');
      }
      if (writeCount > 0) {
        print('$collectionName seeded successfully with $writeCount new items.');
      } else if (skippedCount == data.length) {
        print('$collectionName: All items already exist. No new items seeded.');
      } else {
        print('$collectionName: No items to seed or an issue occurred.');
      }

    } catch (e) {
      print('Error seeding $collectionName: $e');
    }
  }
}