// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yoga_session_flow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YogaSessionFlow {

 String get id; String get flowId;// Foreign key to YogaFlow
 int get sessionOrderIndex;
/// Create a copy of YogaSessionFlow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YogaSessionFlowCopyWith<YogaSessionFlow> get copyWith => _$YogaSessionFlowCopyWithImpl<YogaSessionFlow>(this as YogaSessionFlow, _$identity);

  /// Serializes this YogaSessionFlow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YogaSessionFlow&&(identical(other.id, id) || other.id == id)&&(identical(other.flowId, flowId) || other.flowId == flowId)&&(identical(other.sessionOrderIndex, sessionOrderIndex) || other.sessionOrderIndex == sessionOrderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flowId,sessionOrderIndex);

@override
String toString() {
  return 'YogaSessionFlow(id: $id, flowId: $flowId, sessionOrderIndex: $sessionOrderIndex)';
}


}

/// @nodoc
abstract mixin class $YogaSessionFlowCopyWith<$Res>  {
  factory $YogaSessionFlowCopyWith(YogaSessionFlow value, $Res Function(YogaSessionFlow) _then) = _$YogaSessionFlowCopyWithImpl;
@useResult
$Res call({
 String id, String flowId, int sessionOrderIndex
});




}
/// @nodoc
class _$YogaSessionFlowCopyWithImpl<$Res>
    implements $YogaSessionFlowCopyWith<$Res> {
  _$YogaSessionFlowCopyWithImpl(this._self, this._then);

  final YogaSessionFlow _self;
  final $Res Function(YogaSessionFlow) _then;

/// Create a copy of YogaSessionFlow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? flowId = null,Object? sessionOrderIndex = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,flowId: null == flowId ? _self.flowId : flowId // ignore: cast_nullable_to_non_nullable
as String,sessionOrderIndex: null == sessionOrderIndex ? _self.sessionOrderIndex : sessionOrderIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _YogaSessionFlow extends YogaSessionFlow {
  const _YogaSessionFlow({required this.id, required this.flowId, required this.sessionOrderIndex}): super._();
  factory _YogaSessionFlow.fromJson(Map<String, dynamic> json) => _$YogaSessionFlowFromJson(json);

@override final  String id;
@override final  String flowId;
// Foreign key to YogaFlow
@override final  int sessionOrderIndex;

/// Create a copy of YogaSessionFlow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YogaSessionFlowCopyWith<_YogaSessionFlow> get copyWith => __$YogaSessionFlowCopyWithImpl<_YogaSessionFlow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YogaSessionFlowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YogaSessionFlow&&(identical(other.id, id) || other.id == id)&&(identical(other.flowId, flowId) || other.flowId == flowId)&&(identical(other.sessionOrderIndex, sessionOrderIndex) || other.sessionOrderIndex == sessionOrderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flowId,sessionOrderIndex);

@override
String toString() {
  return 'YogaSessionFlow(id: $id, flowId: $flowId, sessionOrderIndex: $sessionOrderIndex)';
}


}

/// @nodoc
abstract mixin class _$YogaSessionFlowCopyWith<$Res> implements $YogaSessionFlowCopyWith<$Res> {
  factory _$YogaSessionFlowCopyWith(_YogaSessionFlow value, $Res Function(_YogaSessionFlow) _then) = __$YogaSessionFlowCopyWithImpl;
@override @useResult
$Res call({
 String id, String flowId, int sessionOrderIndex
});




}
/// @nodoc
class __$YogaSessionFlowCopyWithImpl<$Res>
    implements _$YogaSessionFlowCopyWith<$Res> {
  __$YogaSessionFlowCopyWithImpl(this._self, this._then);

  final _YogaSessionFlow _self;
  final $Res Function(_YogaSessionFlow) _then;

/// Create a copy of YogaSessionFlow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? flowId = null,Object? sessionOrderIndex = null,}) {
  return _then(_YogaSessionFlow(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,flowId: null == flowId ? _self.flowId : flowId // ignore: cast_nullable_to_non_nullable
as String,sessionOrderIndex: null == sessionOrderIndex ? _self.sessionOrderIndex : sessionOrderIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
