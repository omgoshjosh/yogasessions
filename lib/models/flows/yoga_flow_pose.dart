import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/models/duration_converter.dart';

part 'yoga_flow_pose.freezed.dart';
part 'yoga_flow_pose.g.dart';

@freezed
abstract class YogaFlowPose with _$YogaFlowPose {
  const factory YogaFlowPose({
    String? id,
    required String poseId,
    required String flowId,
    String? sessionId,
    required int orderIndex,
    @Default(true) bool inSync,
    // Mirrored properties from YogaPose
    String? originalId,
    required String name,
    required String description,
    String? sanskritName,
    @Default(1) int strengthDifficulty,
    @Default(1) int flexibilityDifficulty,
    @Default(1) int balanceDifficulty,
    @Default([]) List<String> labels,
    @DurationConverter() required Duration duration,
    @Default('-1') String creatorUserId,
    @Default(false) bool isPublished,
  }) = _YogaFlowPose;

  factory YogaFlowPose.fromJson(Map<String, dynamic> json) => _$YogaFlowPoseFromJson(json);
}
