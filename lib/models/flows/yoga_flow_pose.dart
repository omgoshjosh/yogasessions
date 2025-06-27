import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_flow_pose.freezed.dart';
part 'yoga_flow_pose.g.dart';

@freezed
abstract class YogaFlowPose with _$YogaFlowPose {
  const YogaFlowPose._();

  const factory YogaFlowPose({
    required String id, // Document ID for this specific link/instance
    required String flowId, // ID of the YogaFlow this pose belongs to, Foreign key to YogaFlow
    required String poseId,  // ID of the YogaPose, Foreign key to YogaPose
    required int flowOrderIndex, // Order of this pose within the flow
    required int durationInSeconds, // how long do you hold the pose
  }) = _YogaFlowPose;

  factory YogaFlowPose.fromJson(Map<String, dynamic> json) => _$YogaFlowPoseFromJson(json);
}

//
// class YogaFlowPose {
//   final String id;
//   final String flowId;
//   final String poseId;
//   final int flowOrderIndex;
//   final int durationInSeconds;
//
//   // Note: No copies of pose details (name, description, etc.) here.
//   // The flow will look up the YogaPose details using poseId.
//
//   YogaFlowPose({
//     required this.id,
//     required this.flowId,
//     required this.poseId,
//     required this.flowOrderIndex,
//     required this.durationInSeconds,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'flowId': flowId,
//       'poseId': poseId,
//       'flowOrderIndex': flowOrderIndex,
//       'durationInSeconds': durationInSeconds,
//       // 'id' is not included here as it's the document ID
//     };
//   }
//
//   factory YogaFlowPose.fromMap(Map<String, dynamic> map, String documentId) {
//     return YogaFlowPose(
//       id: documentId,
//       flowId: map['flowId'] ?? '',
//       poseId: map['poseId'] ?? '',
//       flowOrderIndex: map['flowOrderIndex'] ?? 0,
//       durationInSeconds: map['durationInSeconds'] ?? 60, // Default duration
//     );
//   }
// }
