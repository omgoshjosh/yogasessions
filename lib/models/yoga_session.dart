import 'package:freezed_annotation/freezed_annotation.dart';
import 'yoga_session_pose.dart';
import 'yoga_session_flow.dart';

part 'yoga_session.freezed.dart';
part 'yoga_session.g.dart';

@freezed
abstract class YogaSession with _$YogaSession {
  const YogaSession._();

  const factory YogaSession({
    required String id,
    String? originalId,
    required String name,
    required String description,
    @Default('-1') String creatorUserId,
    @Default(false) bool isPublished,
    @Default([]) List<YogaSessionPose> directPoses,
    @Default([]) List<YogaSessionFlow> includedFlows,
  }) = _YogaSession;

  factory YogaSession.fromJson(Map<String, dynamic> json) => _$YogaSessionFromJson(json);
}
