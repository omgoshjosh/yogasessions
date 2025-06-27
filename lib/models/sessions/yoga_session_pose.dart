import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_session_pose.freezed.dart';
part 'yoga_session_pose.g.dart';

@freezed
abstract class YogaSessionPose with _$YogaSessionPose {
  const YogaSessionPose._();

  const factory YogaSessionPose({
    required String id,
    required String originalYogaPoseId, // Foreign key to the library YogaPose.id
    required String name, // Can be customized for this session instance
    required String description, // Can be customized for this session instance
    String? sanskritName, // Can be customized for this session instance
    String? imageUrl, // Can be customized for this session instance
    required int durationInSeconds,
    required int sessionOrderIndex, // Order among all components in a YogaSession
    @Default(false) bool isCustomSnapshot, // True if name, desc, etc., were overridden
  }) = _YogaSessionPose;

  factory YogaSessionPose.fromJson(Map<String, dynamic> json) => _$YogaSessionPoseFromJson(json);
}
