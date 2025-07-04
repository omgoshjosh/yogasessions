import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/utils/duration_converter.dart';

part 'yoga_pose.freezed.dart';
part 'yoga_pose.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
abstract class YogaPose with _$YogaPose {
  const YogaPose._();

  const factory YogaPose({
    String? id,
    String? originalId,
    @Default('Name Not Provided') String? name,
    @Default('Description not provided.') String? description,
    @Default('Sanskrit Name Unavailable') String? sanskritName,
    int? strengthDifficulty,
    int? flexibilityDifficulty,
    int? balanceDifficulty,
    @Default([]) List<String> labels,
    @DurationConverter() Duration? duration,
    String? creatorUserId,
    @Default(false) bool isPublished,
    @Default(true) bool inSync,
  }) = _YogaPose;

  factory YogaPose.fromJson(Map<String, dynamic> json) => _$YogaPoseFromJson(json);

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
