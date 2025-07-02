// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yoga_flow_pose.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YogaFlowPose {

 String get id;// Document ID for this specific link/instance
 String get flowId;// ID of the YogaFlow this pose belongs to, Foreign key to YogaFlow
 String get poseId;// ID of the YogaPose, Foreign key to YogaPose
 int get flowOrderIndex;// Order of this pose within the flow
 int get durationInSeconds;
/// Create a copy of YogaFlowPose
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YogaFlowPoseCopyWith<YogaFlowPose> get copyWith => _$YogaFlowPoseCopyWithImpl<YogaFlowPose>(this as YogaFlowPose, _$identity);

  /// Serializes this YogaFlowPose to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YogaFlowPose&&(identical(other.id, id) || other.id == id)&&(identical(other.flowId, flowId) || other.flowId == flowId)&&(identical(other.poseId, poseId) || other.poseId == poseId)&&(identical(other.flowOrderIndex, flowOrderIndex) || other.flowOrderIndex == flowOrderIndex)&&(identical(other.durationInSeconds, durationInSeconds) || other.durationInSeconds == durationInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flowId,poseId,flowOrderIndex,durationInSeconds);

@override
String toString() {
  return 'YogaFlowPose(id: $id, flowId: $flowId, poseId: $poseId, flowOrderIndex: $flowOrderIndex, durationInSeconds: $durationInSeconds)';
}


}

/// @nodoc
abstract mixin class $YogaFlowPoseCopyWith<$Res>  {
  factory $YogaFlowPoseCopyWith(YogaFlowPose value, $Res Function(YogaFlowPose) _then) = _$YogaFlowPoseCopyWithImpl;
@useResult
$Res call({
 String id, String flowId, String poseId, int flowOrderIndex, int durationInSeconds
});




}
/// @nodoc
class _$YogaFlowPoseCopyWithImpl<$Res>
    implements $YogaFlowPoseCopyWith<$Res> {
  _$YogaFlowPoseCopyWithImpl(this._self, this._then);

  final YogaFlowPose _self;
  final $Res Function(YogaFlowPose) _then;

/// Create a copy of YogaFlowPose
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? flowId = null,Object? poseId = null,Object? flowOrderIndex = null,Object? durationInSeconds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,flowId: null == flowId ? _self.flowId : flowId // ignore: cast_nullable_to_non_nullable
as String,poseId: null == poseId ? _self.poseId : poseId // ignore: cast_nullable_to_non_nullable
as String,flowOrderIndex: null == flowOrderIndex ? _self.flowOrderIndex : flowOrderIndex // ignore: cast_nullable_to_non_nullable
as int,durationInSeconds: null == durationInSeconds ? _self.durationInSeconds : durationInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _YogaFlowPose extends YogaFlowPose {
  const _YogaFlowPose({required this.id, required this.flowId, required this.poseId, required this.flowOrderIndex, required this.durationInSeconds}): super._();
  factory _YogaFlowPose.fromJson(Map<String, dynamic> json) => _$YogaFlowPoseFromJson(json);

@override final  String id;
// Document ID for this specific link/instance
@override final  String flowId;
// ID of the YogaFlow this pose belongs to, Foreign key to YogaFlow
@override final  String poseId;
// ID of the YogaPose, Foreign key to YogaPose
@override final  int flowOrderIndex;
// Order of this pose within the flow
@override final  int durationInSeconds;

/// Create a copy of YogaFlowPose
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YogaFlowPoseCopyWith<_YogaFlowPose> get copyWith => __$YogaFlowPoseCopyWithImpl<_YogaFlowPose>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YogaFlowPoseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YogaFlowPose&&(identical(other.id, id) || other.id == id)&&(identical(other.flowId, flowId) || other.flowId == flowId)&&(identical(other.poseId, poseId) || other.poseId == poseId)&&(identical(other.flowOrderIndex, flowOrderIndex) || other.flowOrderIndex == flowOrderIndex)&&(identical(other.durationInSeconds, durationInSeconds) || other.durationInSeconds == durationInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flowId,poseId,flowOrderIndex,durationInSeconds);

@override
String toString() {
  return 'YogaFlowPose(id: $id, flowId: $flowId, poseId: $poseId, flowOrderIndex: $flowOrderIndex, durationInSeconds: $durationInSeconds)';
}


}

/// @nodoc
abstract mixin class _$YogaFlowPoseCopyWith<$Res> implements $YogaFlowPoseCopyWith<$Res> {
  factory _$YogaFlowPoseCopyWith(_YogaFlowPose value, $Res Function(_YogaFlowPose) _then) = __$YogaFlowPoseCopyWithImpl;
@override @useResult
$Res call({
 String id, String flowId, String poseId, int flowOrderIndex, int durationInSeconds
});




}
/// @nodoc
class __$YogaFlowPoseCopyWithImpl<$Res>
    implements _$YogaFlowPoseCopyWith<$Res> {
  __$YogaFlowPoseCopyWithImpl(this._self, this._then);

  final _YogaFlowPose _self;
  final $Res Function(_YogaFlowPose) _then;

/// Create a copy of YogaFlowPose
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? flowId = null,Object? poseId = null,Object? flowOrderIndex = null,Object? durationInSeconds = null,}) {
  return _then(_YogaFlowPose(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,flowId: null == flowId ? _self.flowId : flowId // ignore: cast_nullable_to_non_nullable
as String,poseId: null == poseId ? _self.poseId : poseId // ignore: cast_nullable_to_non_nullable
as String,flowOrderIndex: null == flowOrderIndex ? _self.flowOrderIndex : flowOrderIndex // ignore: cast_nullable_to_non_nullable
as int,durationInSeconds: null == durationInSeconds ? _self.durationInSeconds : durationInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
