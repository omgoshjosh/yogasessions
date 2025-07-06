import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/poses/yoga_pose.dart';
import 'firestore_service.dart';

class YogaPoseService {
  final FirestoreService _firestoreService;
  static const String _collectionPath = 'yoga_poses';

  YogaPoseService({required FirestoreService firestoreService})
      : _firestoreService = firestoreService;

  // Create a new YogaPose, Firestore generates the ID
  Future<YogaPose> createYogaPose(YogaPose poseData) async {
    final data = poseData.toJson(); // Freezed model's toJson

    // Corrected: Positional arguments
    final DocumentReference docRef =
        await _firestoreService.addDocument(_collectionPath, data);
    return poseData.copyWith(id: docRef.id);
  }

  // Read a single YogaPose by its ID
  Future<YogaPose?> getYogaPose(String id) async {
    final data = await _firestoreService.getDocumentOnce(
      path: _collectionPath,
      id: id,
    );
    if (data != null) {
      // The data map from getDocumentOnce now includes the 'id'
      return YogaPose.fromJson(data);
    }
    return null;
  }

  // Get all poses marked as published (our current "featured")
  Future<List<YogaPose>> getPublishedYogaPoses({
    String? orderByField,
    bool descending = false,
    int? limit,
  }) async {
    final List<Map<String, dynamic>> snapshotData =
        await _firestoreService.getDocumentsWhere(
      collectionPath: _collectionPath,
      field: 'isPublished',
      isEqualTo: true,
      orderByField: orderByField,
      descending: descending,
      limit: limit,
    );
    // Each map in snapshotData from getDocumentsWhere now includes the 'id'
    return snapshotData.map((data) => YogaPose.fromJson(data)).toList();
  }

  // Get all poses created by a specific user
  Future<List<YogaPose>> getYogaPosesByCreator(
    String userId, {
    String? orderByField,
    bool descending = false,
    int? limit,
  }) async {
    final List<Map<String, dynamic>> snapshotData =
        await _firestoreService.getDocumentsWhere(
      collectionPath: _collectionPath,
      field: 'creatorUserId',
      isEqualTo: userId,
      orderByField: orderByField,
      descending: descending,
      limit: limit,
    );
    // Each map in snapshotData from getDocumentsWhere now includes the 'id'
    return snapshotData.map((data) => YogaPose.fromJson(data)).toList();
  }

  // Update an existing YogaPose
  Future<void> updateYogaPose(YogaPose pose) async {
    if (pose.id == '' || pose.id == null) {
      throw ArgumentError('YogaPose ID cannot be empty for an update.');
    }
    // Corrected: Positional arguments
    await _firestoreService.updateDocument(
        _collectionPath, pose.id!, pose.toJson());
  }

  // Delete a YogaPose
  Future<void> deleteYogaPose(String id) async {
    if (id.isEmpty) {
      throw ArgumentError('YogaPose ID cannot be empty for delete.');
    }
    // Corrected: Positional arguments
    await _firestoreService.deleteDocument(_collectionPath, id);
  }
}
