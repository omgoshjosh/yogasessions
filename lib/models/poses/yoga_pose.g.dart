// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_pose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YogaPose _$YogaPoseFromJson(Map<String, dynamic> json) => YogaPose();

Map<String, dynamic> _$YogaPoseToJson(YogaPose instance) => <String, dynamic>{};

_YogaPose _$YogaPoseFromJson(Map<String, dynamic> json) => _YogaPose(
  id: json['id'] as String?,
  originalId: json['originalId'] as String?,
  name: json['name'] as String? ?? 'Name Not Provided',
  description: json['description'] as String? ?? 'Description not provided.',
  sanskritName: json['sanskritName'] as String? ?? 'Sanskrit Name Unavailable',
  strengthDifficulty: (json['strengthDifficulty'] as num?)?.toInt(),
  flexibilityDifficulty: (json['flexibilityDifficulty'] as num?)?.toInt(),
  balanceDifficulty: (json['balanceDifficulty'] as num?)?.toInt(),
  labels:
      (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  duration: _$JsonConverterFromJson<int, Duration>(
    json['duration'],
    const DurationConverter().fromJson,
  ),
  creatorUserId: json['creatorUserId'] as String?,
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
  'duration': _$JsonConverterToJson<int, Duration>(
    instance.duration,
    const DurationConverter().toJson,
  ),
  'creatorUserId': instance.creatorUserId,
  'isPublished': instance.isPublished,
  'inSync': instance.inSync,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
