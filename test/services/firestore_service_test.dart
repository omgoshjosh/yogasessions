import 'package:flutter_test/flutter_test.dart';
// import 'package:yogasessions/models/poses/yoga_pose.dart';
// import 'package:yogasessions/services/firestore_service.dart';

void main() {
  group('FirestoreService', () {
    // late FakeFirebaseFirestore fakeFirestore;
    // late FirestoreService firestoreService;

    setUp(() {
      // fakeFirestore = FakeFirebaseFirestore();
      // firestoreService = FirestoreService(firestore: fakeFirestore);
    });

    test('getCollection returns a list of YogaPose objects', () async {
      // 1. Setup
      // final posesCollection = fakeFirestore.collection('poses');
      // await posesCollection.add({
      //   'name': 'Downward-Facing Dog',
      //   'description': 'A foundational yoga pose.',
      //   'image': 'https://example.com/downward_dog.jpg',
      // });
      // await posesCollection.add({
      //   'name': 'Mountain Pose',
      //   'description': 'A standing pose that improves posture.',
      //   'image': 'https://example.com/mountain_pose.jpg',
      // });
      //
      // // 2. Act
      // final poses = await firestoreService.getCollection<YogaPose>(
      //   path: 'poses',
      //   builder: (data, documentId) => YogaPose.fromJson(data!),
      // );

      // 3. Assert
      // expect(poses, isA<List<YogaPose>>());
      // expect(poses.length, 2);
      // expect(poses[0].name, 'Downward-Facing Dog');
    });
  });
}
