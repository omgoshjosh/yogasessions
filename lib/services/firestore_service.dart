import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:yogasessions/models/yoga_pose.dart'; // Assuming YogaPose is updated for seeding

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

  // Stream-based method to get a single document
  Stream<T?> getDocument<T>({
    required String path,
    required String id,
    required T Function(Map<String, dynamic> data, String documentID) builder,
  }) {
    final reference = _db.collection(path).doc(id);
    return reference.snapshots().map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        // Here, builder is responsible for merging ID if needed, or using it separately
        return builder(snapshot.data()!, snapshot.id);
      }
      return null;
    });
  }

  // Stream-based method to get a collection
  Stream<List<T>> getCollection<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentID) builder,
    Query Function(Query query)? queryBuilder, // Corrected type here
  }) {
    Query query = _db.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query); // No need to cast if type is correct
    }
    // Builder is responsible for merging ID if needed, or using it separately
    return query.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => builder(doc.data() as Map<String, dynamic>, doc.id)).toList());
  }

  // --- New Non-Stream Methods ---

  // Fetches a single document once, including its ID in the returned map
  Future<Map<String, dynamic>?> getDocumentOnce({
    required String path,
    required String id,
  }) async {
    final reference = _db.collection(path).doc(id);
    final snapshot = await reference.get();
    if (snapshot.exists && snapshot.data() != null) {
      // Include the document ID in the returned map
      return {...snapshot.data()!, 'id': snapshot.id};
    }
    return null;
  }

  // Fetches documents from a collection based on a simple where clause (one-time fetch),
  // including their IDs in the returned maps.
  Future<List<Map<String, dynamic>>> getDocumentsWhere({
    required String collectionPath,
    required String field,
    required dynamic isEqualTo,
    String? orderByField,
    bool descending = false,
    int? limit,
  }) async {
    Query query = _db.collection(collectionPath).where(field, isEqualTo: isEqualTo);

    if (orderByField != null) {
      query = query.orderBy(orderByField, descending: descending);
    }
    if (limit != null) {
      query = query.limit(limit);
    }

    final querySnapshot = await query.get();
    return querySnapshot.docs.map((doc) {
      // Include the document ID in the returned map
      final data = doc.data() as Map<String, dynamic>;
      return {...data, 'id': doc.id};
    }).toList();
  }

  // Updated seeding method
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
        
        final String poseName = poseDataMap['name'] as String;
        // Check if a pose with the same name already exists to prevent duplicates
        final querySnapshot = await collectionRef.where('name', isEqualTo: poseName).limit(1).get();

        if (querySnapshot.docs.isEmpty) {
          // Create a YogaPose instance. Firestore will generate the ID upon add/set.
          // For seeding, if your JSON contains IDs and you want to preserve them, ensure they are used.
          // Here, we're assuming Firestore generates IDs if not explicitly set on the docRef.
          YogaPose pose = YogaPose(
            // id: docRef.id, // ID will be set by Firestore or by specific docRef
            id: 'temporary-id', // This will be overwritten if Firestore generates one, or used if we specify doc.
            name: poseName,
            description: poseDataMap['description'] ?? '',
            sanskritName: poseDataMap['sanskritName'], // Assuming these keys exist or handle nulls
            imageUrl: poseDataMap['imageUrl'],
            originalId: poseDataMap['originalId'], 
            creatorUserId: poseDataMap['creatorUserId'] ?? '-1', // Default if null
            isPublished: poseDataMap['isPublished'] ?? true,   // Default if null
          );

          // If your JSON data contains an 'id' you want to use for the document ID:
          DocumentReference docRef;
          if (poseDataMap.containsKey('id') && poseDataMap['id'] != null) {
            docRef = collectionRef.doc(poseDataMap['id'] as String);
          } else {
            // Let Firestore generate a new ID
            docRef = collectionRef.doc(); 
          }
          // Use toJson() as generated by Freezed
          batch.set(docRef, pose.copyWith(id: docRef.id).toJson()); 
          writeCount++;
        } else {
          skippedCount++;
        }

        // Commit batch periodically to avoid exceeding Firestore limits
        if (writeCount > 0 && writeCount % 400 == 0) { // Firestore batch limit is 500 operations
            await batch.commit();
            batch = _db.batch(); // Start a new batch
        }
      }
      // Commit any remaining writes in the last batch
      if (writeCount % 400 != 0 && writeCount > 0) { // Check if there's anything left to commit
        await batch.commit();
      }
      
      if (skippedCount > 0) {
        print('$collectionName: Skipped $skippedCount existing items.');
      }
      if (writeCount > 0) {
        print('$collectionName seeded successfully with $writeCount new items.');
      } else if (skippedCount == data.length && data.isNotEmpty) { // ensure data is not empty
        print('$collectionName: All items already exist. No new items seeded.');
      } else if (data.isEmpty) {
        print('$collectionName: No items to seed.');
      } else {
        // This case might be if writeCount is 0 and skippedCount is less than data.length
        print('$collectionName: No new items were seeded (possibly due to all items existing or other issues).');
      }

    } catch (e) {
      print('Error seeding $collectionName: $e');
    }
  }
}
