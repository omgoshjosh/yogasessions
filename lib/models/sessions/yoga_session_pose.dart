import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/utils/duration_converter.dart';

part 'yoga_session_pose.freezed.dart';
part 'yoga_session_pose.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
abstract class YogaSessionPose with _$YogaSessionPose {
  const factory YogaSessionPose({
    String? id,
    String? poseId,
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
  }) = _YogaSessionPose;

  factory YogaSessionPose.fromJson(Map<String, dynamic> json) => _$YogaSessionPoseFromJson(json);
}
