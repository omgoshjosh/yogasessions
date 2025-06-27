import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_pose.freezed.dart';
part 'yoga_pose.g.dart';

@freezed
abstract class YogaPose with _$YogaPose {
  // Added private empty constructor
  const YogaPose._();

  const factory YogaPose({
    required String id,
    String? originalId, // ID of the pose this was copied from, if any
    required String name,
    required String description,
    String? sanskritName,
    String? imageUrl,
    @Default('-1') String creatorUserId, // -1 for system/seed, user ID otherwise
    @Default(false) bool isPublished,   // True if visible in a public/featured library
  }) = _YogaPose;

  factory YogaPose.fromJson(Map<String, dynamic> json) => _$YogaPoseFromJson(json);
}
