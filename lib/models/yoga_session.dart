import 'yoga_session_pose.dart';

class YogaSession {
  final String id;
  final String name;
  final String description;
  final List<YogaSessionPose> poses;
  final int totalDuration; // This could also be a getter: poses.fold(0, (sum, pose) => sum + pose.durationInSeconds)
  final bool isCustom;

  YogaSession({
    required this.id,
    required this.name,
    required this.description,
    required this.poses,
    required this.totalDuration,
    required this.isCustom,
  });
}
