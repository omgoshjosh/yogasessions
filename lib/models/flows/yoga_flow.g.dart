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
  creatorUserId: json['creatorUserId'] as String? ?? '-1',
  isPublished: json['isPublished'] as bool? ?? false,
);

Map<String, dynamic> _$YogaFlowToJson(_YogaFlow instance) => <String, dynamic>{
  'id': instance.id,
  'originalId': instance.originalId,
  'name': instance.name,
  'description': instance.description,
  'creatorUserId': instance.creatorUserId,
  'isPublished': instance.isPublished,
};
