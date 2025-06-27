// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_flow_pose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YogaFlowPose _$YogaFlowPoseFromJson(Map<String, dynamic> json) =>
    _YogaFlowPose(
      id: json['id'] as String,
      flowId: json['flowId'] as String,
      poseId: json['poseId'] as String,
      flowOrderIndex: (json['flowOrderIndex'] as num).toInt(),
      durationInSeconds: (json['durationInSeconds'] as num).toInt(),
    );

Map<String, dynamic> _$YogaFlowPoseToJson(_YogaFlowPose instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flowId': instance.flowId,
      'poseId': instance.poseId,
      'flowOrderIndex': instance.flowOrderIndex,
      'durationInSeconds': instance.durationInSeconds,
    };
