import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_session.freezed.dart';
part 'yoga_session.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
abstract class YogaSession with _$YogaSession {
  const YogaSession._();

  const factory YogaSession({
    required String id,
    String? originalId,
    required String name,
    required String description,
    @Default(1) int strengthDifficulty,
    @Default(1) int flexibilityDifficulty,
    @Default(1) int balanceDifficulty,
    @Default([]) List<String> labels,
    @Default('-1') String creatorUserId,
    @Default(false) bool isPublished,
    @Default(true) bool inSync,
  }) = _YogaSession;

  factory YogaSession.fromJson(Map<String, dynamic> json) => _$YogaSessionFromJson(json);

  double get overallDifficulty {
    return (strengthDifficulty + flexibilityDifficulty + balanceDifficulty) / 3.0;
  }
}
