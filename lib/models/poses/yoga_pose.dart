import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/models/duration_converter.dart';

part 'yoga_pose.freezed.dart';
part 'yoga_pose.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
abstract class YogaPose with _$YogaPose {
  const YogaPose._();

  const factory YogaPose({
    required String id,
    String? originalId,
    required String name,
    required String description,
    String? sanskritName,
    @Default(1) int strengthDifficulty,
    @Default(1) int flexibilityDifficulty,
    @Default(1) int balanceDifficulty,
    @Default([]) List<String> labels,
    @DurationConverter() required Duration duration,
    @Default('-1') String creatorUserId,
    @Default(false) bool isPublished,
    @Default(true) bool inSync,
  }) = _YogaPose;

  factory YogaPose.fromJson(Map<String, dynamic> json) => _$YogaPoseFromJson(json);

  double get overallDifficulty {
    return (strengthDifficulty + flexibilityDifficulty + balanceDifficulty) / 3.0;
  }
}
