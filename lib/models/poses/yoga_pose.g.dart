// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_pose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YogaPose _$YogaPoseFromJson(Map<String, dynamic> json) => _YogaPose(
  id: json['id'] as String,
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
  inSync: json['inSync'] as bool? ?? true,
);

Map<String, dynamic> _$YogaPoseToJson(_YogaPose instance) => <String, dynamic>{
  'id': instance.id,
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
  'inSync': instance.inSync,
};
