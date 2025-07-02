// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_flow_pose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YogaFlowPose _$YogaFlowPoseFromJson(
  Map<String, dynamic> json,
) => _YogaFlowPose(
  id: json['id'] as String,
  poseId: json['poseId'] as String,
  flowId: json['flowId'] as String,
  sessionId: json['sessionId'] as String?,
  orderIndex: (json['orderIndex'] as num).toInt(),
  inSync: json['inSync'] as bool? ?? true,
  originalId: json['originalId'] as String?,
  name: json['name'] as String,
  description: json['description'] as String,
  sanskritName: json['sanskritName'] as String?,
  strengthDifficulty: (json['strengthDifficulty'] as num?)?.toInt() ?? 1,
  flexibilityDifficulty: (json['flexibilityDifficulty'] as num?)?.toInt() ?? 1,
  balanceDifficulty: (json['balanceDifficulty'] as num?)?.toInt() ?? 1,
  labels:
      (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  duration: const DurationConverter().fromJson(
    (json['duration'] as num).toInt(),
  ),
  creatorUserId: json['creatorUserId'] as String? ?? '-1',
  isPublished: json['isPublished'] as bool? ?? false,
);

Map<String, dynamic> _$YogaFlowPoseToJson(_YogaFlowPose instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poseId': instance.poseId,
      'flowId': instance.flowId,
      'sessionId': instance.sessionId,
      'orderIndex': instance.orderIndex,
      'inSync': instance.inSync,
      'originalId': instance.originalId,
      'name': instance.name,
      'description': instance.description,
      'sanskritName': instance.sanskritName,
      'strengthDifficulty': instance.strengthDifficulty,
      'flexibilityDifficulty': instance.flexibilityDifficulty,
      'balanceDifficulty': instance.balanceDifficulty,
      'labels': instance.labels,
      'duration': const DurationConverter().toJson(instance.duration),
      'creatorUserId': instance.creatorUserId,
      'isPublished': instance.isPublished,
    };
