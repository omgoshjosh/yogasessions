import 'package:flutter_test/flutter_test.dart';
import 'package:yogasessions/models/flows/yoga_flow.dart';

void main() {
  group('YogaFlow', () {
    test('can be instantiated', () {
      final flow = YogaFlow(
        id: '1',
        name: 'Test Flow',
        description: 'A test flow.',
      );
      expect(flow, isA<YogaFlow>());
    });

    test('calculates overallDifficulty correctly', () {
      final flow = YogaFlow(
        id: '1',
        name: 'Test Flow',
        description: 'A test flow.',
        strengthDifficulty: 2,
        flexibilityDifficulty: 3,
        balanceDifficulty: 4,
      );
      expect(flow.overallDifficulty, 3.0);
    });

    test('handles JSON serialization and deserialization', () {
      final flow = YogaFlow(
        id: '1',
        originalId: 'orig-1',
        name: 'Test Flow',
        description: 'A test flow.',
        strengthDifficulty: 2,
        flexibilityDifficulty: 3,
        balanceDifficulty: 4,
        labels: ['test', 'vinyasa'],
        creatorUserId: 'user-1',
        isPublished: true,
        inSync: false,
      );

      final json = flow.toJson();
      final fromJson = YogaFlow.fromJson(json);

      expect(fromJson, equals(flow));
    });
  });
}
