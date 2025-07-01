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
  category: json['category'] as String?,
  difficulty: json['difficulty'] as String?,
  imageUrl: json['imageUrl'] as String?,
  videoUrl: json['videoUrl'] as String?,
  creatorUserId: json['creatorUserId'] as String? ?? '-1',
  isPublished: json['isPublished'] as bool? ?? false,
);

Map<String, dynamic> _$YogaPoseToJson(_YogaPose instance) => <String, dynamic>{
  'id': instance.id,
  'originalId': instance.originalId,
  'name': instance.name,
  'description': instance.description,
  'sanskritName': instance.sanskritName,
  'category': instance.category,
  'difficulty': instance.difficulty,
  'imageUrl': instance.imageUrl,
  'videoUrl': instance.videoUrl,
  'creatorUserId': instance.creatorUserId,
  'isPublished': instance.isPublished,
};
