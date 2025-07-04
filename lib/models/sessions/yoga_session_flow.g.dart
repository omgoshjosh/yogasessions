// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_session_flow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YogaSessionFlow _$YogaSessionFlowFromJson(Map<String, dynamic> json) =>
    YogaSessionFlow();

Map<String, dynamic> _$YogaSessionFlowToJson(YogaSessionFlow instance) =>
    <String, dynamic>{};

_YogaSessionFlow _$YogaSessionFlowFromJson(
  Map<String, dynamic> json,
) => _YogaSessionFlow(
  id: json['id'] as String?,
  flowId: json['flowId'] as String?,
  sessionId: json['sessionId'] as String?,
  orderIndex: (json['orderIndex'] as num?)?.toInt(),
  inSync: json['inSync'] as bool? ?? true,
  originalId: json['originalId'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  strengthDifficulty: (json['strengthDifficulty'] as num?)?.toInt() ?? 1,
  flexibilityDifficulty: (json['flexibilityDifficulty'] as num?)?.toInt() ?? 1,
  balanceDifficulty: (json['balanceDifficulty'] as num?)?.toInt() ?? 1,
  labels:
      (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  creatorUserId: json['creatorUserId'] as String? ?? '-1',
  isPublished: json['isPublished'] as bool? ?? false,
);

Map<String, dynamic> _$YogaSessionFlowToJson(_YogaSessionFlow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flowId': instance.flowId,
      'sessionId': instance.sessionId,
      'orderIndex': instance.orderIndex,
      'inSync': instance.inSync,
      'originalId': instance.originalId,
      'name': instance.name,
      'description': instance.description,
      'strengthDifficulty': instance.strengthDifficulty,
      'flexibilityDifficulty': instance.flexibilityDifficulty,
      'balanceDifficulty': instance.balanceDifficulty,
      'labels': instance.labels,
      'creatorUserId': instance.creatorUserId,
      'isPublished': instance.isPublished,
    };
