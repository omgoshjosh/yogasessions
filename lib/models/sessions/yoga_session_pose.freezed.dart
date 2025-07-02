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

 String get id; String get originalYogaPoseId;// Foreign key to the library YogaPose.id
 String get name;// Can be customized for this session instance
 String get description;// Can be customized for this session instance
 String? get sanskritName;// Can be customized for this session instance
 String? get imageUrl;// Can be customized for this session instance
 int get durationInSeconds; int get sessionOrderIndex;// Order among all components in a YogaSession
 bool get isCustomSnapshot;
/// Create a copy of YogaSessionPose
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YogaSessionPoseCopyWith<YogaSessionPose> get copyWith => _$YogaSessionPoseCopyWithImpl<YogaSessionPose>(this as YogaSessionPose, _$identity);

  /// Serializes this YogaSessionPose to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YogaSessionPose&&(identical(other.id, id) || other.id == id)&&(identical(other.originalYogaPoseId, originalYogaPoseId) || other.originalYogaPoseId == originalYogaPoseId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.sanskritName, sanskritName) || other.sanskritName == sanskritName)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.durationInSeconds, durationInSeconds) || other.durationInSeconds == durationInSeconds)&&(identical(other.sessionOrderIndex, sessionOrderIndex) || other.sessionOrderIndex == sessionOrderIndex)&&(identical(other.isCustomSnapshot, isCustomSnapshot) || other.isCustomSnapshot == isCustomSnapshot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originalYogaPoseId,name,description,sanskritName,imageUrl,durationInSeconds,sessionOrderIndex,isCustomSnapshot);

@override
String toString() {
  return 'YogaSessionPose(id: $id, originalYogaPoseId: $originalYogaPoseId, name: $name, description: $description, sanskritName: $sanskritName, imageUrl: $imageUrl, durationInSeconds: $durationInSeconds, sessionOrderIndex: $sessionOrderIndex, isCustomSnapshot: $isCustomSnapshot)';
}


}

/// @nodoc
abstract mixin class $YogaSessionPoseCopyWith<$Res>  {
  factory $YogaSessionPoseCopyWith(YogaSessionPose value, $Res Function(YogaSessionPose) _then) = _$YogaSessionPoseCopyWithImpl;
@useResult
$Res call({
 String id, String originalYogaPoseId, String name, String description, String? sanskritName, String? imageUrl, int durationInSeconds, int sessionOrderIndex, bool isCustomSnapshot
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? originalYogaPoseId = null,Object? name = null,Object? description = null,Object? sanskritName = freezed,Object? imageUrl = freezed,Object? durationInSeconds = null,Object? sessionOrderIndex = null,Object? isCustomSnapshot = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originalYogaPoseId: null == originalYogaPoseId ? _self.originalYogaPoseId : originalYogaPoseId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sanskritName: freezed == sanskritName ? _self.sanskritName : sanskritName // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,durationInSeconds: null == durationInSeconds ? _self.durationInSeconds : durationInSeconds // ignore: cast_nullable_to_non_nullable
as int,sessionOrderIndex: null == sessionOrderIndex ? _self.sessionOrderIndex : sessionOrderIndex // ignore: cast_nullable_to_non_nullable
as int,isCustomSnapshot: null == isCustomSnapshot ? _self.isCustomSnapshot : isCustomSnapshot // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _YogaSessionPose extends YogaSessionPose {
  const _YogaSessionPose({required this.id, required this.originalYogaPoseId, required this.name, required this.description, this.sanskritName, this.imageUrl, required this.durationInSeconds, required this.sessionOrderIndex, this.isCustomSnapshot = false}): super._();
  factory _YogaSessionPose.fromJson(Map<String, dynamic> json) => _$YogaSessionPoseFromJson(json);

@override final  String id;
@override final  String originalYogaPoseId;
// Foreign key to the library YogaPose.id
@override final  String name;
// Can be customized for this session instance
@override final  String description;
// Can be customized for this session instance
@override final  String? sanskritName;
// Can be customized for this session instance
@override final  String? imageUrl;
// Can be customized for this session instance
@override final  int durationInSeconds;
@override final  int sessionOrderIndex;
// Order among all components in a YogaSession
@override@JsonKey() final  bool isCustomSnapshot;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YogaSessionPose&&(identical(other.id, id) || other.id == id)&&(identical(other.originalYogaPoseId, originalYogaPoseId) || other.originalYogaPoseId == originalYogaPoseId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.sanskritName, sanskritName) || other.sanskritName == sanskritName)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.durationInSeconds, durationInSeconds) || other.durationInSeconds == durationInSeconds)&&(identical(other.sessionOrderIndex, sessionOrderIndex) || other.sessionOrderIndex == sessionOrderIndex)&&(identical(other.isCustomSnapshot, isCustomSnapshot) || other.isCustomSnapshot == isCustomSnapshot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originalYogaPoseId,name,description,sanskritName,imageUrl,durationInSeconds,sessionOrderIndex,isCustomSnapshot);

@override
String toString() {
  return 'YogaSessionPose(id: $id, originalYogaPoseId: $originalYogaPoseId, name: $name, description: $description, sanskritName: $sanskritName, imageUrl: $imageUrl, durationInSeconds: $durationInSeconds, sessionOrderIndex: $sessionOrderIndex, isCustomSnapshot: $isCustomSnapshot)';
}


}

/// @nodoc
abstract mixin class _$YogaSessionPoseCopyWith<$Res> implements $YogaSessionPoseCopyWith<$Res> {
  factory _$YogaSessionPoseCopyWith(_YogaSessionPose value, $Res Function(_YogaSessionPose) _then) = __$YogaSessionPoseCopyWithImpl;
@override @useResult
$Res call({
 String id, String originalYogaPoseId, String name, String description, String? sanskritName, String? imageUrl, int durationInSeconds, int sessionOrderIndex, bool isCustomSnapshot
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? originalYogaPoseId = null,Object? name = null,Object? description = null,Object? sanskritName = freezed,Object? imageUrl = freezed,Object? durationInSeconds = null,Object? sessionOrderIndex = null,Object? isCustomSnapshot = null,}) {
  return _then(_YogaSessionPose(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originalYogaPoseId: null == originalYogaPoseId ? _self.originalYogaPoseId : originalYogaPoseId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sanskritName: freezed == sanskritName ? _self.sanskritName : sanskritName // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,durationInSeconds: null == durationInSeconds ? _self.durationInSeconds : durationInSeconds // ignore: cast_nullable_to_non_nullable
as int,sessionOrderIndex: null == sessionOrderIndex ? _self.sessionOrderIndex : sessionOrderIndex // ignore: cast_nullable_to_non_nullable
as int,isCustomSnapshot: null == isCustomSnapshot ? _self.isCustomSnapshot : isCustomSnapshot // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
