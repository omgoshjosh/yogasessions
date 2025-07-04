import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_flow.freezed.dart';
part 'yoga_flow.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
abstract class YogaFlow with _$YogaFlow {
  const YogaFlow._();

  const factory YogaFlow({
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
  }) = _YogaFlow;

  factory YogaFlow.fromJson(Map<String, dynamic> json) => _$YogaFlowFromJson(json);

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
