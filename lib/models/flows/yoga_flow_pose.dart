import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/utils/duration_converter.dart';

part 'yoga_flow_pose.freezed.dart';
part 'yoga_flow_pose.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
abstract class YogaFlowPose with _$YogaFlowPose {
  const factory YogaFlowPose({
    String? id,
    String? poseId,
    String? flowId,
    String? sessionId,
    int? orderIndex,
    @Default(true) bool inSync,
    // Mirrored properties from YogaPose
    String? originalId,
    String? name,
    String? description,
    String? sanskritName,
    @Default(1) int strengthDifficulty,
    @Default(1) int flexibilityDifficulty,
    @Default(1) int balanceDifficulty,
    @Default([]) List<String> labels,
    @DurationConverter() Duration? duration,
    @Default('-1') String creatorUserId,
    @Default(false) bool isPublished,
  }) = _YogaFlowPose;

  factory YogaFlowPose.fromJson(Map<String, dynamic> json) => _$YogaFlowPoseFromJson(json);
}
