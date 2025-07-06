// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yoga_session_pose.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YogaSessionPose {

 String? get id; String? get poseId; String? get sessionId; int? get orderIndex; bool get inSync;// Mirrored properties from YogaPose
 String? get originalId; String? get name; String? get description; String? get sanskritName; int get strengthDifficulty; int get flexibilityDifficulty; int get balanceDifficulty; List<String> get labels;@DurationConverter() Duration? get duration; String get creatorUserId; bool get isPublished;
/// Create a copy of YogaSessionPose
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YogaSessionPoseCopyWith<YogaSessionPose> get copyWith => _$YogaSessionPoseCopyWithImpl<YogaSessionPose>(this as YogaSessionPose, _$identity);

  /// Serializes this YogaSessionPose to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YogaSessionPose&&(identical(other.id, id) || other.id == id)&&(identical(other.poseId, poseId) || other.poseId == poseId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.inSync, inSync) || other.inSync == inSync)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.sanskritName, sanskritName) || other.sanskritName == sanskritName)&&(identical(other.strengthDifficulty, strengthDifficulty) || other.strengthDifficulty == strengthDifficulty)&&(identical(other.flexibilityDifficulty, flexibilityDifficulty) || other.flexibilityDifficulty == flexibilityDifficulty)&&(identical(other.balanceDifficulty, balanceDifficulty) || other.balanceDifficulty == balanceDifficulty)&&const DeepCollectionEquality().equals(other.labels, labels)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,poseId,sessionId,orderIndex,inSync,originalId,name,description,sanskritName,strengthDifficulty,flexibilityDifficulty,balanceDifficulty,const DeepCollectionEquality().hash(labels),duration,creatorUserId,isPublished);

@override
String toString() {
  return 'YogaSessionPose(id: $id, poseId: $poseId, sessionId: $sessionId, orderIndex: $orderIndex, inSync: $inSync, originalId: $originalId, name: $name, description: $description, sanskritName: $sanskritName, strengthDifficulty: $strengthDifficulty, flexibilityDifficulty: $flexibilityDifficulty, balanceDifficulty: $balanceDifficulty, labels: $labels, duration: $duration, creatorUserId: $creatorUserId, isPublished: $isPublished)';
}


}

/// @nodoc
abstract mixin class $YogaSessionPoseCopyWith<$Res>  {
  factory $YogaSessionPoseCopyWith(YogaSessionPose value, $Res Function(YogaSessionPose) _then) = _$YogaSessionPoseCopyWithImpl;
@useResult
$Res call({
 String? id, String? poseId, String? sessionId, int? orderIndex, bool inSync, String? originalId, String? name, String? description, String? sanskritName, int strengthDifficulty, int flexibilityDifficulty, int balanceDifficulty, List<String> labels,@DurationConverter() Duration? duration, String creatorUserId, bool isPublished
});




}
/// @nodoc
class _$YogaSessionPoseCopyWithImpl<$Res>
    implements $YogaSessionPoseCopyWith<$Res> {
  _$YogaSessionPoseCopyWithImpl(this._self, this._then);

  final YogaSessionPose _self;
  final $Res Function(YogaSessionPose) _then;

/// Create a copy of YogaSessionPose
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? poseId = freezed,Object? sessionId = freezed,Object? orderIndex = freezed,Object? inSync = null,Object? originalId = freezed,Object? name = freezed,Object? description = freezed,Object? sanskritName = freezed,Object? strengthDifficulty = null,Object? flexibilityDifficulty = null,Object? balanceDifficulty = null,Object? labels = null,Object? duration = freezed,Object? creatorUserId = null,Object? isPublished = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,poseId: freezed == poseId ? _self.poseId : poseId // ignore: cast_nullable_to_non_nullable
as String?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,orderIndex: freezed == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int?,inSync: null == inSync ? _self.inSync : inSync // ignore: cast_nullable_to_non_nullable
as bool,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,sanskritName: freezed == sanskritName ? _self.sanskritName : sanskritName // ignore: cast_nullable_to_non_nullable
as String?,strengthDifficulty: null == strengthDifficulty ? _self.strengthDifficulty : strengthDifficulty // ignore: cast_nullable_to_non_nullable
as int,flexibilityDifficulty: null == flexibilityDifficulty ? _self.flexibilityDifficulty : flexibilityDifficulty // ignore: cast_nullable_to_non_nullable
as int,balanceDifficulty: null == balanceDifficulty ? _self.balanceDifficulty : balanceDifficulty // ignore: cast_nullable_to_non_nullable
as int,labels: null == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _YogaSessionPose implements YogaSessionPose {
  const _YogaSessionPose({this.id, this.poseId, this.sessionId, this.orderIndex, this.inSync = true, this.originalId, this.name, this.description, this.sanskritName, this.strengthDifficulty = 1, this.flexibilityDifficulty = 1, this.balanceDifficulty = 1, final  List<String> labels = const [], @DurationConverter() this.duration, this.creatorUserId = '-1', this.isPublished = false}): _labels = labels;
  factory _YogaSessionPose.fromJson(Map<String, dynamic> json) => _$YogaSessionPoseFromJson(json);

@override final  String? id;
@override final  String? poseId;
@override final  String? sessionId;
@override final  int? orderIndex;
@override@JsonKey() final  bool inSync;
// Mirrored properties from YogaPose
@override final  String? originalId;
@override final  String? name;
@override final  String? description;
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

@override@DurationConverter() final  Duration? duration;
@override@JsonKey() final  String creatorUserId;
@override@JsonKey() final  bool isPublished;

/// Create a copy of YogaSessionPose
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YogaSessionPoseCopyWith<_YogaSessionPose> get copyWith => __$YogaSessionPoseCopyWithImpl<_YogaSessionPose>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YogaSessionPoseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YogaSessionPose&&(identical(other.id, id) || other.id == id)&&(identical(other.poseId, poseId) || other.poseId == poseId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.inSync, inSync) || other.inSync == inSync)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.sanskritName, sanskritName) || other.sanskritName == sanskritName)&&(identical(other.strengthDifficulty, strengthDifficulty) || other.strengthDifficulty == strengthDifficulty)&&(identical(other.flexibilityDifficulty, flexibilityDifficulty) || other.flexibilityDifficulty == flexibilityDifficulty)&&(identical(other.balanceDifficulty, balanceDifficulty) || other.balanceDifficulty == balanceDifficulty)&&const DeepCollectionEquality().equals(other._labels, _labels)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,poseId,sessionId,orderIndex,inSync,originalId,name,description,sanskritName,strengthDifficulty,flexibilityDifficulty,balanceDifficulty,const DeepCollectionEquality().hash(_labels),duration,creatorUserId,isPublished);

@override
String toString() {
  return 'YogaSessionPose(id: $id, poseId: $poseId, sessionId: $sessionId, orderIndex: $orderIndex, inSync: $inSync, originalId: $originalId, name: $name, description: $description, sanskritName: $sanskritName, strengthDifficulty: $strengthDifficulty, flexibilityDifficulty: $flexibilityDifficulty, balanceDifficulty: $balanceDifficulty, labels: $labels, duration: $duration, creatorUserId: $creatorUserId, isPublished: $isPublished)';
}


}

/// @nodoc
abstract mixin class _$YogaSessionPoseCopyWith<$Res> implements $YogaSessionPoseCopyWith<$Res> {
  factory _$YogaSessionPoseCopyWith(_YogaSessionPose value, $Res Function(_YogaSessionPose) _then) = __$YogaSessionPoseCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? poseId, String? sessionId, int? orderIndex, bool inSync, String? originalId, String? name, String? description, String? sanskritName, int strengthDifficulty, int flexibilityDifficulty, int balanceDifficulty, List<String> labels,@DurationConverter() Duration? duration, String creatorUserId, bool isPublished
});




}
/// @nodoc
class __$YogaSessionPoseCopyWithImpl<$Res>
    implements _$YogaSessionPoseCopyWith<$Res> {
  __$YogaSessionPoseCopyWithImpl(this._self, this._then);

  final _YogaSessionPose _self;
  final $Res Function(_YogaSessionPose) _then;

/// Create a copy of YogaSessionPose
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? poseId = freezed,Object? sessionId = freezed,Object? orderIndex = freezed,Object? inSync = null,Object? originalId = freezed,Object? name = freezed,Object? description = freezed,Object? sanskritName = freezed,Object? strengthDifficulty = null,Object? flexibilityDifficulty = null,Object? balanceDifficulty = null,Object? labels = null,Object? duration = freezed,Object? creatorUserId = null,Object? isPublished = null,}) {
  return _then(_YogaSessionPose(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,poseId: freezed == poseId ? _self.poseId : poseId // ignore: cast_nullable_to_non_nullable
as String?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,orderIndex: freezed == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int?,inSync: null == inSync ? _self.inSync : inSync // ignore: cast_nullable_to_non_nullable
as bool,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,sanskritName: freezed == sanskritName ? _self.sanskritName : sanskritName // ignore: cast_nullable_to_non_nullable
as String?,strengthDifficulty: null == strengthDifficulty ? _self.strengthDifficulty : strengthDifficulty // ignore: cast_nullable_to_non_nullable
as int,flexibilityDifficulty: null == flexibilityDifficulty ? _self.flexibilityDifficulty : flexibilityDifficulty // ignore: cast_nullable_to_non_nullable
as int,balanceDifficulty: null == balanceDifficulty ? _self.balanceDifficulty : balanceDifficulty // ignore: cast_nullable_to_non_nullable
as int,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
