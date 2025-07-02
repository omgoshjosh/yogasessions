import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/models/duration_converter.dart';

part 'yoga_session_pose.freezed.dart';
part 'yoga_session_pose.g.dart';

@freezed
abstract class YogaSessionPose with _$YogaSessionPose {
  const factory YogaSessionPose({
    required String id,
    required String poseId,
    required String sessionId,
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
  }) = _YogaSessionPose;

  factory YogaSessionPose.fromJson(Map<String, dynamic> json) => _$YogaSessionPoseFromJson(json);
}
