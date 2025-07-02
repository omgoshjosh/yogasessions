import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_session_flow.freezed.dart';
part 'yoga_session_flow.g.dart';

@freezed
abstract class YogaSessionFlow with _$YogaSessionFlow {
  const YogaSessionFlow._();

  const factory YogaSessionFlow({
    required String id,
    required String flowId, // Foreign key to YogaFlow
    required int sessionOrderIndex, // Order among all components in a YogaSession
  }) = _YogaSessionFlow;

  factory YogaSessionFlow.fromJson(Map<String, dynamic> json) => _$YogaSessionFlowFromJson(json);
}
