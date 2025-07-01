// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yoga_pose.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YogaPose {

 String get id; String? get originalId;// ID of the pose this was copied from, if any
 String get name; String get description; String? get sanskritName; String? get category; String? get difficulty; String? get imageUrl; String? get videoUrl; String get creatorUserId;// -1 for system/seed, user ID otherwise
 bool get isPublished;
/// Create a copy of YogaPose
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YogaPoseCopyWith<YogaPose> get copyWith => _$YogaPoseCopyWithImpl<YogaPose>(this as YogaPose, _$identity);

  /// Serializes this YogaPose to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YogaPose&&(identical(other.id, id) || other.id == id)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.sanskritName, sanskritName) || other.sanskritName == sanskritName)&&(identical(other.category, category) || other.category == category)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originalId,name,description,sanskritName,category,difficulty,imageUrl,videoUrl,creatorUserId,isPublished);

@override
String toString() {
  return 'YogaPose(id: $id, originalId: $originalId, name: $name, description: $description, sanskritName: $sanskritName, category: $category, difficulty: $difficulty, imageUrl: $imageUrl, videoUrl: $videoUrl, creatorUserId: $creatorUserId, isPublished: $isPublished)';
}


}

/// @nodoc
abstract mixin class $YogaPoseCopyWith<$Res>  {
  factory $YogaPoseCopyWith(YogaPose value, $Res Function(YogaPose) _then) = _$YogaPoseCopyWithImpl;
@useResult
$Res call({
 String id, String? originalId, String name, String description, String? sanskritName, String? category, String? difficulty, String? imageUrl, String? videoUrl, String creatorUserId, bool isPublished
});




}
/// @nodoc
class _$YogaPoseCopyWithImpl<$Res>
    implements $YogaPoseCopyWith<$Res> {
  _$YogaPoseCopyWithImpl(this._self, this._then);

  final YogaPose _self;
  final $Res Function(YogaPose) _then;

/// Create a copy of YogaPose
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? originalId = freezed,Object? name = null,Object? description = null,Object? sanskritName = freezed,Object? category = freezed,Object? difficulty = freezed,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? creatorUserId = null,Object? isPublished = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sanskritName: freezed == sanskritName ? _self.sanskritName : sanskritName // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _YogaPose extends YogaPose {
  const _YogaPose({required this.id, this.originalId, required this.name, required this.description, this.sanskritName, this.category, this.difficulty, this.imageUrl, this.videoUrl, this.creatorUserId = '-1', this.isPublished = false}): super._();
  factory _YogaPose.fromJson(Map<String, dynamic> json) => _$YogaPoseFromJson(json);

@override final  String id;
@override final  String? originalId;
// ID of the pose this was copied from, if any
@override final  String name;
@override final  String description;
@override final  String? sanskritName;
@override final  String? category;
@override final  String? difficulty;
@override final  String? imageUrl;
@override final  String? videoUrl;
@override@JsonKey() final  String creatorUserId;
// -1 for system/seed, user ID otherwise
@override@JsonKey() final  bool isPublished;

/// Create a copy of YogaPose
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YogaPoseCopyWith<_YogaPose> get copyWith => __$YogaPoseCopyWithImpl<_YogaPose>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YogaPoseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YogaPose&&(identical(other.id, id) || other.id == id)&&(identical(other.originalId, originalId) || other.originalId == originalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.sanskritName, sanskritName) || other.sanskritName == sanskritName)&&(identical(other.category, category) || other.category == category)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originalId,name,description,sanskritName,category,difficulty,imageUrl,videoUrl,creatorUserId,isPublished);

@override
String toString() {
  return 'YogaPose(id: $id, originalId: $originalId, name: $name, description: $description, sanskritName: $sanskritName, category: $category, difficulty: $difficulty, imageUrl: $imageUrl, videoUrl: $videoUrl, creatorUserId: $creatorUserId, isPublished: $isPublished)';
}


}

/// @nodoc
abstract mixin class _$YogaPoseCopyWith<$Res> implements $YogaPoseCopyWith<$Res> {
  factory _$YogaPoseCopyWith(_YogaPose value, $Res Function(_YogaPose) _then) = __$YogaPoseCopyWithImpl;
@override @useResult
$Res call({
 String id, String? originalId, String name, String description, String? sanskritName, String? category, String? difficulty, String? imageUrl, String? videoUrl, String creatorUserId, bool isPublished
});




}
/// @nodoc
class __$YogaPoseCopyWithImpl<$Res>
    implements _$YogaPoseCopyWith<$Res> {
  __$YogaPoseCopyWithImpl(this._self, this._then);

  final _YogaPose _self;
  final $Res Function(_YogaPose) _then;

/// Create a copy of YogaPose
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? originalId = freezed,Object? name = null,Object? description = null,Object? sanskritName = freezed,Object? category = freezed,Object? difficulty = freezed,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? creatorUserId = null,Object? isPublished = null,}) {
  return _then(_YogaPose(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originalId: freezed == originalId ? _self.originalId : originalId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sanskritName: freezed == sanskritName ? _self.sanskritName : sanskritName // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,creatorUserId: null == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
