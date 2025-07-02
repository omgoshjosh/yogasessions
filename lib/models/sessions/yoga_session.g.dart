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
  strengthDifficulty: (json['strengthDifficulty'] as num?)?.toInt() ?? 1,
  flexibilityDifficulty: (json['flexibilityDifficulty'] as num?)?.toInt() ?? 1,
  balanceDifficulty: (json['balanceDifficulty'] as num?)?.toInt() ?? 1,
  labels:
      (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  creatorUserId: json['creatorUserId'] as String? ?? '-1',
  isPublished: json['isPublished'] as bool? ?? false,
  inSync: json['inSync'] as bool? ?? true,
);

Map<String, dynamic> _$YogaSessionToJson(_YogaSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalId': instance.originalId,
      'name': instance.name,
      'description': instance.description,
      'strengthDifficulty': instance.strengthDifficulty,
      'flexibilityDifficulty': instance.flexibilityDifficulty,
      'balanceDifficulty': instance.balanceDifficulty,
      'labels': instance.labels,
      'creatorUserId': instance.creatorUserId,
      'isPublished': instance.isPublished,
      'inSync': instance.inSync,
    };
