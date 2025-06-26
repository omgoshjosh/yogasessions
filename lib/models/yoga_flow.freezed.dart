// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yoga_flow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YogaFlow {

 String get id; String? get originalId;// ID of the flow this was copied from, if any
 String get name; String get description; String get creatorUserId;// -1 for system/seed, user ID otherwise
 bool get isPublished;
/// Create a copy of YogaFlow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YogaFlowCopyWith<YogaFlow> get copyWith => _$YogaFlowCopyWithImpl<YogaFlow>(this as YogaFlow, _$identity);

  /// Serializes this YogaFlow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YogaFlow&&(identical(other.id, id) || other.id == id)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originalId,name,description,creatorUserId,isPublished);

@override
String toString() {
  return 'YogaFlow(id: $id, originalId: $originalId, name: $name, description: $description, creatorUserId: $creatorUserId, isPublished: $isPublished)';
}


}

/// @nodoc
abstract mixin class $YogaFlowCopyWith<$Res>  {
  factory $YogaFlowCopyWith(YogaFlow value, $Res Function(YogaFlow) _then) = _$YogaFlowCopyWithImpl;
@useResult
$Res call({
 String id, String? originalId, String name, String description, String creatorUserId, bool isPublished
});




}
/// @nodoc
class _$YogaFlowCopyWithImpl<$Res>
    implements $YogaFlowCopyWith<$Res> {
  _$YogaFlowCopyWithImpl(this._self, this._then);

  final YogaFlow _self;
  final $Res Function(YogaFlow) _then;

/// Create a copy of YogaFlow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? originalId = freezed,Object? name = null,Object? description = null,Object? creatorUserId = null,Object? isPublished = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _YogaFlow extends YogaFlow {
  const _YogaFlow({required this.id, this.originalId, required this.name, required this.description, this.creatorUserId = '-1', this.isPublished = false}): super._();
  factory _YogaFlow.fromJson(Map<String, dynamic> json) => _$YogaFlowFromJson(json);

@override final  String id;
@override final  String? originalId;
// ID of the flow this was copied from, if any
@override final  String name;
@override final  String description;
@override@JsonKey() final  String creatorUserId;
// -1 for system/seed, user ID otherwise
@override@JsonKey() final  bool isPublished;

/// Create a copy of YogaFlow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YogaFlowCopyWith<_YogaFlow> get copyWith => __$YogaFlowCopyWithImpl<_YogaFlow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YogaFlowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YogaFlow&&(identical(other.id, id) || other.id == id)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originalId,name,description,creatorUserId,isPublished);

@override
String toString() {
  return 'YogaFlow(id: $id, originalId: $originalId, name: $name, description: $description, creatorUserId: $creatorUserId, isPublished: $isPublished)';
}


}

/// @nodoc
abstract mixin class _$YogaFlowCopyWith<$Res> implements $YogaFlowCopyWith<$Res> {
  factory _$YogaFlowCopyWith(_YogaFlow value, $Res Function(_YogaFlow) _then) = __$YogaFlowCopyWithImpl;
@override @useResult
$Res call({
 String id, String? originalId, String name, String description, String creatorUserId, bool isPublished
});




}
/// @nodoc
class __$YogaFlowCopyWithImpl<$Res>
    implements _$YogaFlowCopyWith<$Res> {
  __$YogaFlowCopyWithImpl(this._self, this._then);

  final _YogaFlow _self;
  final $Res Function(_YogaFlow) _then;

/// Create a copy of YogaFlow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? originalId = freezed,Object? name = null,Object? description = null,Object? creatorUserId = null,Object? isPublished = null,}) {
  return _then(_YogaFlow(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
