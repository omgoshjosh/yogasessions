// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_session_flow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YogaSessionFlow _$YogaSessionFlowFromJson(Map<String, dynamic> json) =>
    _YogaSessionFlow(
      id: json['id'] as String,
      flowId: json['flowId'] as String,
      sessionOrderIndex: (json['sessionOrderIndex'] as num).toInt(),
    );

Map<String, dynamic> _$YogaSessionFlowToJson(_YogaSessionFlow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flowId': instance.flowId,
      'sessionOrderIndex': instance.sessionOrderIndex,
    };
