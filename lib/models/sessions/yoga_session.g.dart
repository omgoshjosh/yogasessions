// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YogaSession _$YogaSessionFromJson(Map<String, dynamic> json) => YogaSession();

Map<String, dynamic> _$YogaSessionToJson(YogaSession instance) =>
    <String, dynamic>{};

_YogaSession _$YogaSessionFromJson(Map<String, dynamic> json) => _YogaSession(
  id: json['id'] as String?,
  originalId: json['originalId'] as String?,
  name: json['name'] as String? ?? 'Name Not Provided',
  description: json['description'] as String? ?? 'Description not provided.',
  strengthDifficulty: (json['strengthDifficulty'] as num?)?.toInt(),
  flexibilityDifficulty: (json['flexibilityDifficulty'] as num?)?.toInt(),
  balanceDifficulty: (json['balanceDifficulty'] as num?)?.toInt(),
  labels:
      (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  creatorUserId: json['creatorUserId'] as String?,
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
