// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yoga_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YogaSession {

 String get id; String? get originalId; String get name; String get description; String get creatorUserId; bool get isPublished; List<YogaSessionPose> get directPoses; List<YogaSessionFlow> get includedFlows;
/// Create a copy of YogaSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YogaSessionCopyWith<YogaSession> get copyWith => _$YogaSessionCopyWithImpl<YogaSession>(this as YogaSession, _$identity);

  /// Serializes this YogaSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YogaSession&&(identical(other.id, id) || other.id == id)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&const DeepCollectionEquality().equals(other.directPoses, directPoses)&&const DeepCollectionEquality().equals(other.includedFlows, includedFlows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originalId,name,description,creatorUserId,isPublished,const DeepCollectionEquality().hash(directPoses),const DeepCollectionEquality().hash(includedFlows));

@override
String toString() {
  return 'YogaSession(id: $id, originalId: $originalId, name: $name, description: $description, creatorUserId: $creatorUserId, isPublished: $isPublished, directPoses: $directPoses, includedFlows: $includedFlows)';
}


}

/// @nodoc
abstract mixin class $YogaSessionCopyWith<$Res>  {
  factory $YogaSessionCopyWith(YogaSession value, $Res Function(YogaSession) _then) = _$YogaSessionCopyWithImpl;
@useResult
$Res call({
 String id, String? originalId, String name, String description, String creatorUserId, bool isPublished, List<YogaSessionPose> directPoses, List<YogaSessionFlow> includedFlows
});




}
/// @nodoc
class _$YogaSessionCopyWithImpl<$Res>
    implements $YogaSessionCopyWith<$Res> {
  _$YogaSessionCopyWithImpl(this._self, this._then);

  final YogaSession _self;
  final $Res Function(YogaSession) _then;

/// Create a copy of YogaSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? originalId = freezed,Object? name = null,Object? description = null,Object? creatorUserId = null,Object? isPublished = null,Object? directPoses = null,Object? includedFlows = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,directPoses: null == directPoses ? _self.directPoses : directPoses // ignore: cast_nullable_to_non_nullable
as List<YogaSessionPose>,includedFlows: null == includedFlows ? _self.includedFlows : includedFlows // ignore: cast_nullable_to_non_nullable
as List<YogaSessionFlow>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _YogaSession extends YogaSession {
  const _YogaSession({required this.id, this.originalId, required this.name, required this.description, this.creatorUserId = '-1', this.isPublished = false, final  List<YogaSessionPose> directPoses = const [], final  List<YogaSessionFlow> includedFlows = const []}): _directPoses = directPoses,_includedFlows = includedFlows,super._();
  factory _YogaSession.fromJson(Map<String, dynamic> json) => _$YogaSessionFromJson(json);

@override final  String id;
@override final  String? originalId;
@override final  String name;
@override final  String description;
@override@JsonKey() final  String creatorUserId;
@override@JsonKey() final  bool isPublished;
 final  List<YogaSessionPose> _directPoses;
@override@JsonKey() List<YogaSessionPose> get directPoses {
  if (_directPoses is EqualUnmodifiableListView) return _directPoses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_directPoses);
}

 final  List<YogaSessionFlow> _includedFlows;
@override@JsonKey() List<YogaSessionFlow> get includedFlows {
  if (_includedFlows is EqualUnmodifiableListView) return _includedFlows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_includedFlows);
}


/// Create a copy of YogaSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YogaSessionCopyWith<_YogaSession> get copyWith => __$YogaSessionCopyWithImpl<_YogaSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YogaSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YogaSession&&(identical(other.id, id) || other.id == id)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&const DeepCollectionEquality().equals(other._directPoses, _directPoses)&&const DeepCollectionEquality().equals(other._includedFlows, _includedFlows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originalId,name,description,creatorUserId,isPublished,const DeepCollectionEquality().hash(_directPoses),const DeepCollectionEquality().hash(_includedFlows));

@override
String toString() {
  return 'YogaSession(id: $id, originalId: $originalId, name: $name, description: $description, creatorUserId: $creatorUserId, isPublished: $isPublished, directPoses: $directPoses, includedFlows: $includedFlows)';
}


}

/// @nodoc
abstract mixin class _$YogaSessionCopyWith<$Res> implements $YogaSessionCopyWith<$Res> {
  factory _$YogaSessionCopyWith(_YogaSession value, $Res Function(_YogaSession) _then) = __$YogaSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String? originalId, String name, String description, String creatorUserId, bool isPublished, List<YogaSessionPose> directPoses, List<YogaSessionFlow> includedFlows
});




}
/// @nodoc
class __$YogaSessionCopyWithImpl<$Res>
    implements _$YogaSessionCopyWith<$Res> {
  __$YogaSessionCopyWithImpl(this._self, this._then);

  final _YogaSession _self;
  final $Res Function(_YogaSession) _then;

/// Create a copy of YogaSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? originalId = freezed,Object? name = null,Object? description = null,Object? creatorUserId = null,Object? isPublished = null,Object? directPoses = null,Object? includedFlows = null,}) {
  return _then(_YogaSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,directPoses: null == directPoses ? _self._directPoses : directPoses // ignore: cast_nullable_to_non_nullable
as List<YogaSessionPose>,includedFlows: null == includedFlows ? _self._includedFlows : includedFlows // ignore: cast_nullable_to_non_nullable
as List<YogaSessionFlow>,
  ));
}


}

// dart format on
