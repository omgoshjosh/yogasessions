import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_session.freezed.dart';
part 'yoga_session.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
abstract class YogaSession with _$YogaSession {
  const YogaSession._();

  const factory YogaSession({
    String? id,
    String? originalId,
    @Default('Name Not Provided') String? name,
    @Default('Description not provided.') String? description,
    int? strengthDifficulty,
    int? flexibilityDifficulty,
    int? balanceDifficulty,
    @Default([]) List<String> labels,
    String? creatorUserId,
    @Default(false) bool isPublished,
    @Default(true) bool inSync,
  }) = _YogaSession;

  factory YogaSession.fromJson(Map<String, dynamic> json) => _$YogaSessionFromJson(json);

  double get overallDifficulty {
    double sum = 0;
    int count = 0;
    if (strengthDifficulty != null) {
      sum += strengthDifficulty!;
      count++;
    }
    if (flexibilityDifficulty != null) {
      sum += flexibilityDifficulty!;
      count++;
    }
    if (balanceDifficulty != null) {
      sum += balanceDifficulty!;
      count++;
    }
    return count == 0 ? 0.0 : sum / count;
  }
}
