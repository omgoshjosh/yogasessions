// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_flow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YogaFlow _$YogaFlowFromJson(Map<String, dynamic> json) => _YogaFlow(
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

Map<String, dynamic> _$YogaFlowToJson(_YogaFlow instance) => <String, dynamic>{
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
