import 'package:flutter_test/flutter_test.dart';
import 'package:yogasessions/models/poses/yoga_pose.dart';

void main() {
  group('YogaPose', () {
    test('can be instantiated', () {
      final pose = YogaPose(
        id: '1',
        name: 'Test Pose',
        description: 'A test pose.',
        duration: Duration(seconds: 30),
      );
      expect(pose, isA<YogaPose>());
    });

    test('calculates overallDifficulty correctly', () {
      final pose = YogaPose(
        id: '1',
        name: 'Test Pose',
        description: 'A test pose.',
        strengthDifficulty: 3,
        flexibilityDifficulty: 4,
        balanceDifficulty: 5,
        duration: Duration(seconds: 30),
      );
      expect(pose.overallDifficulty, 4.0);
    });

    test('handles JSON serialization and deserialization', () {
      final pose = YogaPose(
        id: '1',
        originalId: 'orig-1',
        name: 'Test Pose',
        description: 'A test pose.',
        sanskritName: 'Testasana',
        strengthDifficulty: 3,
        flexibilityDifficulty: 4,
        balanceDifficulty: 5,
        labels: ['test', 'beginner'],
        duration: Duration(seconds: 30),
        creatorUserId: 'user-1',
        isPublished: true,
        inSync: false,
      );

      final json = pose.toJson();
      final fromJson = YogaPose.fromJson(json);

      expect(fromJson, equals(pose));
    });
  });
}
