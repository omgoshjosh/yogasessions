import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_flow.freezed.dart';
part 'yoga_flow.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
abstract class YogaFlow with _$YogaFlow {
  const YogaFlow._();

  const factory YogaFlow({
    required String id,
    String? originalId,
    required String name,
    required String description,
    @Default(1) int strengthDifficulty,
    @Default(1) int flexibilityDifficulty,
    @Default(1) int balanceDifficulty,
    @Default([]) List<String> labels,
    @Default('-1') String creatorUserId,
    @Default(false) bool isPublished,
    @Default(true) bool inSync,
  }) = _YogaFlow;

  factory YogaFlow.fromJson(Map<String, dynamic> json) => _$YogaFlowFromJson(json);

  double get overallDifficulty {
    return (strengthDifficulty + flexibilityDifficulty + balanceDifficulty) / 3.0;
  }
}
