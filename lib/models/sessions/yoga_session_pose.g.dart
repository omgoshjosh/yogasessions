// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_session_pose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YogaSessionPose _$YogaSessionPoseFromJson(Map<String, dynamic> json) =>
    _YogaSessionPose(
      id: json['id'] as String,
      originalYogaPoseId: json['originalYogaPoseId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      sanskritName: json['sanskritName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      durationInSeconds: (json['durationInSeconds'] as num).toInt(),
      sessionOrderIndex: (json['sessionOrderIndex'] as num).toInt(),
      isCustomSnapshot: json['isCustomSnapshot'] as bool? ?? false,
    );

Map<String, dynamic> _$YogaSessionPoseToJson(_YogaSessionPose instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalYogaPoseId': instance.originalYogaPoseId,
      'name': instance.name,
      'description': instance.description,
      'sanskritName': instance.sanskritName,
      'imageUrl': instance.imageUrl,
      'durationInSeconds': instance.durationInSeconds,
      'sessionOrderIndex': instance.sessionOrderIndex,
      'isCustomSnapshot': instance.isCustomSnapshot,
    };
