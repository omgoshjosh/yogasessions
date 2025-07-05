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

 String? get id; String? get originalId; String? get name; String? get description; int? get strengthDifficulty; int? get flexibilityDifficulty; int? get balanceDifficulty; List<String> get labels; String? get creatorUserId; bool get isPublished; bool get inSync;
/// Create a copy of YogaFlow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YogaFlowCopyWith<YogaFlow> get copyWith => _$YogaFlowCopyWithImpl<YogaFlow>(this as YogaFlow, _$identity);

  /// Serializes this YogaFlow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YogaFlow&&(identical(other.id, id) || other.id == id)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.strengthDifficulty, strengthDifficulty) || other.strengthDifficulty == strengthDifficulty)&&(identical(other.flexibilityDifficulty, flexibilityDifficulty) || other.flexibilityDifficulty == flexibilityDifficulty)&&(identical(other.balanceDifficulty, balanceDifficulty) || other.balanceDifficulty == balanceDifficulty)&&const DeepCollectionEquality().equals(other.labels, labels)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.inSync, inSync) || other.inSync == inSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originalId,name,description,strengthDifficulty,flexibilityDifficulty,balanceDifficulty,const DeepCollectionEquality().hash(labels),creatorUserId,isPublished,inSync);

@override
String toString() {
  return 'YogaFlow(id: $id, originalId: $originalId, name: $name, description: $description, strengthDifficulty: $strengthDifficulty, flexibilityDifficulty: $flexibilityDifficulty, balanceDifficulty: $balanceDifficulty, labels: $labels, creatorUserId: $creatorUserId, isPublished: $isPublished, inSync: $inSync)';
}


}

/// @nodoc
abstract mixin class $YogaFlowCopyWith<$Res>  {
  factory $YogaFlowCopyWith(YogaFlow value, $Res Function(YogaFlow) _then) = _$YogaFlowCopyWithImpl;
@useResult
$Res call({
 String? id, String? originalId, String? name, String? description, int? strengthDifficulty, int? flexibilityDifficulty, int? balanceDifficulty, List<String> labels, String? creatorUserId, bool isPublished, bool inSync
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? originalId = freezed,Object? name = freezed,Object? description = freezed,Object? strengthDifficulty = freezed,Object? flexibilityDifficulty = freezed,Object? balanceDifficulty = freezed,Object? labels = null,Object? creatorUserId = freezed,Object? isPublished = null,Object? inSync = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,strengthDifficulty: freezed == strengthDifficulty ? _self.strengthDifficulty : strengthDifficulty // ignore: cast_nullable_to_non_nullable
as int?,flexibilityDifficulty: freezed == flexibilityDifficulty ? _self.flexibilityDifficulty : flexibilityDifficulty // ignore: cast_nullable_to_non_nullable
as int?,balanceDifficulty: freezed == balanceDifficulty ? _self.balanceDifficulty : balanceDifficulty // ignore: cast_nullable_to_non_nullable
as int?,labels: null == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,creatorUserId: freezed == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String?,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,inSync: null == inSync ? _self.inSync : inSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _YogaFlow extends YogaFlow {
  const _YogaFlow({this.id, this.originalId, this.name = 'Name Not Provided', this.description = 'Description not provided.', this.strengthDifficulty, this.flexibilityDifficulty, this.balanceDifficulty, final  List<String> labels = const [], this.creatorUserId, this.isPublished = false, this.inSync = true}): _labels = labels,super._();
  factory _YogaFlow.fromJson(Map<String, dynamic> json) => _$YogaFlowFromJson(json);

@override final  String? id;
@override final  String? originalId;
@override@JsonKey() final  String? name;
@override@JsonKey() final  String? description;
@override final  int? strengthDifficulty;
@override final  int? flexibilityDifficulty;
@override final  int? balanceDifficulty;
 final  List<String> _labels;
@override@JsonKey() List<String> get labels {
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_labels);
}

@override final  String? creatorUserId;
@override@JsonKey() final  bool isPublished;
@override@JsonKey() final  bool inSync;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YogaFlow&&(identical(other.id, id) || other.id == id)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.strengthDifficulty, strengthDifficulty) || other.strengthDifficulty == strengthDifficulty)&&(identical(other.flexibilityDifficulty, flexibilityDifficulty) || other.flexibilityDifficulty == flexibilityDifficulty)&&(identical(other.balanceDifficulty, balanceDifficulty) || other.balanceDifficulty == balanceDifficulty)&&const DeepCollectionEquality().equals(other._labels, _labels)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.inSync, inSync) || other.inSync == inSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originalId,name,description,strengthDifficulty,flexibilityDifficulty,balanceDifficulty,const DeepCollectionEquality().hash(_labels),creatorUserId,isPublished,inSync);

@override
String toString() {
  return 'YogaFlow(id: $id, originalId: $originalId, name: $name, description: $description, strengthDifficulty: $strengthDifficulty, flexibilityDifficulty: $flexibilityDifficulty, balanceDifficulty: $balanceDifficulty, labels: $labels, creatorUserId: $creatorUserId, isPublished: $isPublished, inSync: $inSync)';
}


}

/// @nodoc
abstract mixin class _$YogaFlowCopyWith<$Res> implements $YogaFlowCopyWith<$Res> {
  factory _$YogaFlowCopyWith(_YogaFlow value, $Res Function(_YogaFlow) _then) = __$YogaFlowCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? originalId, String? name, String? description, int? strengthDifficulty, int? flexibilityDifficulty, int? balanceDifficulty, List<String> labels, String? creatorUserId, bool isPublished, bool inSync
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? originalId = freezed,Object? name = freezed,Object? description = freezed,Object? strengthDifficulty = freezed,Object? flexibilityDifficulty = freezed,Object? balanceDifficulty = freezed,Object? labels = null,Object? creatorUserId = freezed,Object? isPublished = null,Object? inSync = null,}) {
  return _then(_YogaFlow(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,strengthDifficulty: freezed == strengthDifficulty ? _self.strengthDifficulty : strengthDifficulty // ignore: cast_nullable_to_non_nullable
as int?,flexibilityDifficulty: freezed == flexibilityDifficulty ? _self.flexibilityDifficulty : flexibilityDifficulty // ignore: cast_nullable_to_non_nullable
as int?,balanceDifficulty: freezed == balanceDifficulty ? _self.balanceDifficulty : balanceDifficulty // ignore: cast_nullable_to_non_nullable
as int?,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,creatorUserId: freezed == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String?,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,inSync: null == inSync ? _self.inSync : inSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
