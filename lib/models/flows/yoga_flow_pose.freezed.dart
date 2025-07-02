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

 String get id; String get poseId; String get flowId; String? get sessionId; int get orderIndex; bool get inSync;// Mirrored properties from YogaPose
 String? get originalId; String get name; String get description; String? get sanskritName; int get strengthDifficulty; int get flexibilityDifficulty; int get balanceDifficulty; List<String> get labels;@DurationConverter() Duration get duration; String get creatorUserId; bool get isPublished;
/// Create a copy of YogaFlowPose
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YogaFlowPoseCopyWith<YogaFlowPose> get copyWith => _$YogaFlowPoseCopyWithImpl<YogaFlowPose>(this as YogaFlowPose, _$identity);

  /// Serializes this YogaFlowPose to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YogaFlowPose&&(identical(other.id, id) || other.id == id)&&(identical(other.poseId, poseId) || other.poseId == poseId)&&(identical(other.flowId, flowId) || other.flowId == flowId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.inSync, inSync) || other.inSync == inSync)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.sanskritName, sanskritName) || other.sanskritName == sanskritName)&&(identical(other.strengthDifficulty, strengthDifficulty) || other.strengthDifficulty == strengthDifficulty)&&(identical(other.flexibilityDifficulty, flexibilityDifficulty) || other.flexibilityDifficulty == flexibilityDifficulty)&&(identical(other.balanceDifficulty, balanceDifficulty) || other.balanceDifficulty == balanceDifficulty)&&const DeepCollectionEquality().equals(other.labels, labels)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,poseId,flowId,sessionId,orderIndex,inSync,originalId,name,description,sanskritName,strengthDifficulty,flexibilityDifficulty,balanceDifficulty,const DeepCollectionEquality().hash(labels),duration,creatorUserId,isPublished);

@override
String toString() {
  return 'YogaFlowPose(id: $id, poseId: $poseId, flowId: $flowId, sessionId: $sessionId, orderIndex: $orderIndex, inSync: $inSync, originalId: $originalId, name: $name, description: $description, sanskritName: $sanskritName, strengthDifficulty: $strengthDifficulty, flexibilityDifficulty: $flexibilityDifficulty, balanceDifficulty: $balanceDifficulty, labels: $labels, duration: $duration, creatorUserId: $creatorUserId, isPublished: $isPublished)';
}


}

/// @nodoc
abstract mixin class $YogaFlowPoseCopyWith<$Res>  {
  factory $YogaFlowPoseCopyWith(YogaFlowPose value, $Res Function(YogaFlowPose) _then) = _$YogaFlowPoseCopyWithImpl;
@useResult
$Res call({
 String id, String poseId, String flowId, String? sessionId, int orderIndex, bool inSync, String? originalId, String name, String description, String? sanskritName, int strengthDifficulty, int flexibilityDifficulty, int balanceDifficulty, List<String> labels,@DurationConverter() Duration duration, String creatorUserId, bool isPublished
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? poseId = null,Object? flowId = null,Object? sessionId = freezed,Object? orderIndex = null,Object? inSync = null,Object? originalId = freezed,Object? name = null,Object? description = null,Object? sanskritName = freezed,Object? strengthDifficulty = null,Object? flexibilityDifficulty = null,Object? balanceDifficulty = null,Object? labels = null,Object? duration = null,Object? creatorUserId = null,Object? isPublished = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,poseId: null == poseId ? _self.poseId : poseId // ignore: cast_nullable_to_non_nullable
as String,flowId: null == flowId ? _self.flowId : flowId // ignore: cast_nullable_to_non_nullable
as String,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,inSync: null == inSync ? _self.inSync : inSync // ignore: cast_nullable_to_non_nullable
as bool,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sanskritName: freezed == sanskritName ? _self.sanskritName : sanskritName // ignore: cast_nullable_to_non_nullable
as String?,strengthDifficulty: null == strengthDifficulty ? _self.strengthDifficulty : strengthDifficulty // ignore: cast_nullable_to_non_nullable
as int,flexibilityDifficulty: null == flexibilityDifficulty ? _self.flexibilityDifficulty : flexibilityDifficulty // ignore: cast_nullable_to_non_nullable
as int,balanceDifficulty: null == balanceDifficulty ? _self.balanceDifficulty : balanceDifficulty // ignore: cast_nullable_to_non_nullable
as int,labels: null == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _YogaFlowPose implements YogaFlowPose {
  const _YogaFlowPose({required this.id, required this.poseId, required this.flowId, this.sessionId, required this.orderIndex, this.inSync = true, this.originalId, required this.name, required this.description, this.sanskritName, this.strengthDifficulty = 1, this.flexibilityDifficulty = 1, this.balanceDifficulty = 1, final  List<String> labels = const [], @DurationConverter() required this.duration, this.creatorUserId = '-1', this.isPublished = false}): _labels = labels;
  factory _YogaFlowPose.fromJson(Map<String, dynamic> json) => _$YogaFlowPoseFromJson(json);

@override final  String id;
@override final  String poseId;
@override final  String flowId;
@override final  String? sessionId;
@override final  int orderIndex;
@override@JsonKey() final  bool inSync;
// Mirrored properties from YogaPose
@override final  String? originalId;
@override final  String name;
@override final  String description;
@override final  String? sanskritName;
@override@JsonKey() final  int strengthDifficulty;
@override@JsonKey() final  int flexibilityDifficulty;
@override@JsonKey() final  int balanceDifficulty;
 final  List<String> _labels;
@override@JsonKey() List<String> get labels {
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_labels);
}

@override@DurationConverter() final  Duration duration;
@override@JsonKey() final  String creatorUserId;
@override@JsonKey() final  bool isPublished;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YogaFlowPose&&(identical(other.id, id) || other.id == id)&&(identical(other.poseId, poseId) || other.poseId == poseId)&&(identical(other.flowId, flowId) || other.flowId == flowId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.inSync, inSync) || other.inSync == inSync)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.sanskritName, sanskritName) || other.sanskritName == sanskritName)&&(identical(other.strengthDifficulty, strengthDifficulty) || other.strengthDifficulty == strengthDifficulty)&&(identical(other.flexibilityDifficulty, flexibilityDifficulty) || other.flexibilityDifficulty == flexibilityDifficulty)&&(identical(other.balanceDifficulty, balanceDifficulty) || other.balanceDifficulty == balanceDifficulty)&&const DeepCollectionEquality().equals(other._labels, _labels)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,poseId,flowId,sessionId,orderIndex,inSync,originalId,name,description,sanskritName,strengthDifficulty,flexibilityDifficulty,balanceDifficulty,const DeepCollectionEquality().hash(_labels),duration,creatorUserId,isPublished);

@override
String toString() {
  return 'YogaFlowPose(id: $id, poseId: $poseId, flowId: $flowId, sessionId: $sessionId, orderIndex: $orderIndex, inSync: $inSync, originalId: $originalId, name: $name, description: $description, sanskritName: $sanskritName, strengthDifficulty: $strengthDifficulty, flexibilityDifficulty: $flexibilityDifficulty, balanceDifficulty: $balanceDifficulty, labels: $labels, duration: $duration, creatorUserId: $creatorUserId, isPublished: $isPublished)';
}


}

/// @nodoc
abstract mixin class _$YogaFlowPoseCopyWith<$Res> implements $YogaFlowPoseCopyWith<$Res> {
  factory _$YogaFlowPoseCopyWith(_YogaFlowPose value, $Res Function(_YogaFlowPose) _then) = __$YogaFlowPoseCopyWithImpl;
@override @useResult
$Res call({
 String id, String poseId, String flowId, String? sessionId, int orderIndex, bool inSync, String? originalId, String name, String description, String? sanskritName, int strengthDifficulty, int flexibilityDifficulty, int balanceDifficulty, List<String> labels,@DurationConverter() Duration duration, String creatorUserId, bool isPublished
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? poseId = null,Object? flowId = null,Object? sessionId = freezed,Object? orderIndex = null,Object? inSync = null,Object? originalId = freezed,Object? name = null,Object? description = null,Object? sanskritName = freezed,Object? strengthDifficulty = null,Object? flexibilityDifficulty = null,Object? balanceDifficulty = null,Object? labels = null,Object? duration = null,Object? creatorUserId = null,Object? isPublished = null,}) {
  return _then(_YogaFlowPose(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,poseId: null == poseId ? _self.poseId : poseId // ignore: cast_nullable_to_non_nullable
as String,flowId: null == flowId ? _self.flowId : flowId // ignore: cast_nullable_to_non_nullable
as String,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,inSync: null == inSync ? _self.inSync : inSync // ignore: cast_nullable_to_non_nullable
as bool,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sanskritName: freezed == sanskritName ? _self.sanskritName : sanskritName // ignore: cast_nullable_to_non_nullable
as String?,strengthDifficulty: null == strengthDifficulty ? _self.strengthDifficulty : strengthDifficulty // ignore: cast_nullable_to_non_nullable
as int,flexibilityDifficulty: null == flexibilityDifficulty ? _self.flexibilityDifficulty : flexibilityDifficulty // ignore: cast_nullable_to_non_nullable
as int,balanceDifficulty: null == balanceDifficulty ? _self.balanceDifficulty : balanceDifficulty // ignore: cast_nullable_to_non_nullable
as int,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
