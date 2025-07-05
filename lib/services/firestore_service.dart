import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:yogasessions/models/poses/yoga_pose.dart';

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
    Query Function(Query query)? queryBuilder,
  }) {
    Query query = _db.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    return query.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => builder(doc.data() as Map<String, dynamic>, doc.id)).toList());
  }

  Future<Map<String, dynamic>?> getDocumentOnce({
    required String path,
    required String id,
  }) async {
    final reference = _db.collection(path).doc(id);
    final snapshot = await reference.get();
    if (snapshot.exists && snapshot.data() != null) {
      return {...snapshot.data()!, 'id': snapshot.id};
    }
    return null;
  }

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
      final data = doc.data() as Map<String, dynamic>;
      return {...data, 'id': doc.id};
    }).toList();
  }

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
        final querySnapshot = await collectionRef.where('name', isEqualTo: poseName).limit(1).get();

        if (querySnapshot.docs.isEmpty) {
          // Correctly instantiate YogaPose with the new data model
          YogaPose pose = YogaPose(
            id: 'temporary-id', // Will be replaced by Firestore's generated ID
            name: poseName,
            description: poseDataMap['description'] ?? '',
            sanskritName: poseDataMap['sanskritName'],
            originalId: poseDataMap['originalId'],
            creatorUserId: poseDataMap['creatorUserId'] ?? '-1',
            isPublished: poseDataMap['isPublished'] ?? true,
            duration: Duration(seconds: (poseDataMap['duration'] ?? 0) as int),
            strengthDifficulty: (poseDataMap['strengthDifficulty'] ?? 1) as int,
            flexibilityDifficulty: (poseDataMap['flexibilityDifficulty'] ?? 1) as int,
            balanceDifficulty: (poseDataMap['balanceDifficulty'] ?? 1) as int,
            labels: List<String>.from(poseDataMap['labels'] ?? []),
            inSync: poseDataMap['inSync'] ?? true,
          );

          DocumentReference docRef;
          if (poseDataMap.containsKey('id') && poseDataMap['id'] != null) {
            docRef = collectionRef.doc(poseDataMap['id'] as String);
          } else {
            docRef = collectionRef.doc(); 
          }
          batch.set(docRef, pose.copyWith(id: docRef.id).toJson()); 
          writeCount++;
        } else {
          skippedCount++;
        }

        if (writeCount > 0 && writeCount % 400 == 0) {
            await batch.commit();
            batch = _db.batch();
        }
      }
      if (writeCount % 400 != 0 && writeCount > 0) {
        await batch.commit();
      }
      
      if (skippedCount > 0) {
        print('$collectionName: Skipped $skippedCount existing items.');
      }
      if (writeCount > 0) {
        print('$collectionName seeded successfully with $writeCount new items.');
      } else if (skippedCount == data.length && data.isNotEmpty) {
        print('$collectionName: All items already exist. No new items seeded.');
      } else if (data.isEmpty) {
        print('$collectionName: No items to seed.');
      } else {
        print('$collectionName: No new items were seeded (possibly due to all items existing or other issues).');
      }

    } catch (e) {
      print('Error seeding $collectionName: $e');
    }
  }
}
