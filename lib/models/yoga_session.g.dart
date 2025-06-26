// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YogaSession _$YogaSessionFromJson(Map<String, dynamic> json) => _YogaSession(
  id: json['id'] as String,
  originalId: json['originalId'] as String?,
  name: json['name'] as String,
  description: json['description'] as String,
  creatorUserId: json['creatorUserId'] as String? ?? '-1',
  isPublished: json['isPublished'] as bool? ?? false,
  directPoses:
      (json['directPoses'] as List<dynamic>?)
          ?.map((e) => YogaSessionPose.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  includedFlows:
      (json['includedFlows'] as List<dynamic>?)
          ?.map((e) => YogaSessionFlow.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$YogaSessionToJson(_YogaSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalId': instance.originalId,
      'name': instance.name,
      'description': instance.description,
      'creatorUserId': instance.creatorUserId,
      'isPublished': instance.isPublished,
      'directPoses': instance.directPoses,
      'includedFlows': instance.includedFlows,
    };
