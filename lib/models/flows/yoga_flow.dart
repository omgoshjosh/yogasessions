import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_flow.freezed.dart';
part 'yoga_flow.g.dart';

@freezed
abstract class YogaFlow with _$YogaFlow {
  // Added private empty constructor
  const YogaFlow._();

  const factory YogaFlow({
    required String id,
    String? originalId, // ID of the flow this was copied from, if any
    required String name,
    required String description,
    @Default('-1') String creatorUserId, // -1 for system/seed, user ID otherwise
    @Default(false) bool isPublished,   // True if visible in a public/featured library
  }) = _YogaFlow;

  factory YogaFlow.fromJson(Map<String, dynamic> json) => _$YogaFlowFromJson(json);
}
