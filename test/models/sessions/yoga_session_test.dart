import 'package:flutter_test/flutter_test.dart';
import 'package:yogasessions/models/sessions/yoga_session.dart';

void main() {
  group('YogaSession', () {
    test('can be instantiated', () {
      final session = YogaSession(
        id: '1',
        name: 'Test Session',
        description: 'A test session.',
      );
      expect(session, isA<YogaSession>());
    });

    test('calculates overallDifficulty correctly', () {
      final session = YogaSession(
        id: '1',
        name: 'Test Session',
        description: 'A test session.',
        strengthDifficulty: 1,
        flexibilityDifficulty: 2,
        balanceDifficulty: 3,
      );
      expect(session.overallDifficulty, 2.0);
    });

    test('handles JSON serialization and deserialization', () {
      final session = YogaSession(
        id: '1',
        originalId: 'orig-1',
        name: 'Test Session',
        description: 'A test session.',
        strengthDifficulty: 1,
        flexibilityDifficulty: 2,
        balanceDifficulty: 3,
        labels: ['test', 'hatha'],
        creatorUserId: 'user-1',
        isPublished: true,
        inSync: false,
      );

      final json = session.toJson();
      final fromJson = YogaSession.fromJson(json);

      expect(fromJson, equals(session));
    });
  });
}
