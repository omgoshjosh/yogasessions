import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_session_flow.freezed.dart';
part 'yoga_session_flow.g.dart';

@freezed
abstract class YogaSessionFlow with _$YogaSessionFlow {
  const factory YogaSessionFlow({
    String? id,
    String? flowId,
    String? sessionId,
    int? orderIndex,
    @Default(true) bool inSync,
    // Mirrored properties from YogaFlow
    String? originalId,
    String? name,
    String? description,
    @Default(1) int strengthDifficulty,
    @Default(1) int flexibilityDifficulty,
    @Default(1) int balanceDifficulty,
    @Default([]) List<String> labels,
    @Default('-1') String creatorUserId,
    @Default(false) bool isPublished,
  }) = _YogaSessionFlow;

  factory YogaSessionFlow.fromJson(Map<String, dynamic> json) => _$YogaSessionFlowFromJson(json);
}
