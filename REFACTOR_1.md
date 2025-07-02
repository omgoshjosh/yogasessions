# Refactoring Plan: Data Models (User Story 3.1) - V2 (Composition)

This document outlines the plan to refactor the data models to align with the specifications in `README.md` and `PLAN.md`. This version of the plan incorporates a significant architectural improvement: using **composition** for linking models instead of duplicating fields. This will reduce code duplication, simplify maintenance, and create a clearer domain model.

## 1. Create `DurationConverter`

**Why:** A `JsonConverter` is required because the `freezed` package does not know how to serialize the `Duration` type to and from JSON by default. This converter handles the conversion to an integer (representing seconds), allowing `Duration` to be used in our models.

**File:** `lib/models/duration_converter.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

class DurationConverter implements JsonConverter<Duration, int> {
  const DurationConverter();

  @override
  Duration fromJson(int json) => Duration(seconds: json);

  @override
  int toJson(Duration object) => object.inSeconds;
}
```

## 2. Update `YogaPose` Model

**Why:** The existing `YogaPose` model is missing several fields defined in the `README.md`, such as multiple difficulty ratings, labels, and sync status. This update brings the model into full compliance with the specification.

**File:** `lib/models/poses/yoga_pose.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/models/duration_converter.dart';

part 'yoga_pose.freezed.dart';
part 'yoga_pose.g.dart';

@freezed
abstract class YogaPose with _$YogaPose {
  const YogaPose._();

  @JsonSerializable(explicitToJson: true)
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
```

## 3. Update `YogaFlow` Model

**Why:** Similar to `YogaPose`, the `YogaFlow` model needs to be updated to include the standard set of difficulty ratings and properties to maintain consistency across data models.

**File:** `lib/models/flows/yoga_flow.dart`
```dart
import 'package.freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/models/flows/yoga_flow_pose.dart';

part 'yoga_flow.freezed.dart';
part 'yoga_flow.g.dart';

@freezed
abstract class YogaFlow with _$YogaFlow {
  const YogaFlow._();

  @JsonSerializable(explicitToJson: true)
  const factory YogaFlow({
    required String id,
    String? originalId,
    required String name,
    required String description,
    @Default(1) int strengthDifficulty,
    @Default(1) int flexibilityDifficulty,
    @Default(1) int balanceDifficulty,
    @Default([]) List<String> labels,
    @Default([]) List<YogaFlowPose> poses,
    @Default('-1') String creatorUserId,
    @Default(false) bool isPublished,
    @Default(true) bool inSync,
  }) = _YogaFlow;

  factory YogaFlow.fromJson(Map<String, dynamic> json) => _$YogaFlowFromJson(json);

  double get overallDifficulty {
    return (strengthDifficulty + flexibilityDifficulty + balanceDifficulty) / 3.0;
  }
}
```
## 4. Update `YogaSession` Model

**Why:** The existing `YogaSession` model is incomplete. It must be updated to match the latest project specifications, including the full set of difficulty ratings and other properties required for consistency with the other primary data models.

**File:** `lib/models/sessions/yoga_session.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/models/sessions/yoga_session_flow.dart';
import 'package:yogasessions/models/sessions/yoga_session_pose.dart';

part 'yoga_session.freezed.dart';
part 'yoga_session.g.dart';

@freezed
abstract class YogaSession with _$YogaSession {
  const YogaSession._();

  @JsonSerializable(explicitToJson: true)
  const factory YogaSession({
    required String id,
    String? originalId,
    required String name,
    required String description,
    @Default(1) int strengthDifficulty,
    @Default(1) int flexibilityDifficulty,
    @Default(1) int balanceDifficulty,
    @Default([]) List<String> labels,
    @Default([]) List<YogaSessionPose> poses,
    @Default([]) List<YogaSessionFlow> flows,
    @Default('-1') String creatorUserId,
    @Default(false) bool isPublished,
    @Default(true) bool inSync,
  }) = _YogaSession;

  factory YogaSession.fromJson(Map<String, dynamic> json) => _$YogaSessionFromJson(json);

  double get overallDifficulty {
    return (strengthDifficulty + flexibilityDifficulty + balanceDifficulty) / 3.0;
  }
}
```

## 5. Refactor Linking Models to use Composition

**Why:** The previous approach duplicated all the fields from the original object (`YogaPose` or `YogaFlow`) into the linking model. This creates significant code duplication and maintenance overhead. The better approach is **composition**: the linking model holds a reference to the full object itself. This eliminates duplication and creates a more accurate data model, though it does result in nested JSON.

### `YogaFlowPose`
**File:** `lib/models/flows/yoga_flow_pose.dart`
```dart
import 'package.freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/models/poses/yoga_pose.dart';

part 'yoga_flow_pose.freezed.dart';
part 'yoga_flow_pose.g.dart';

@freezed
abstract class YogaFlowPose with _$YogaFlowPose {
  @JsonSerializable(explicitToJson: true)
  const factory YogaFlowPose({
    required String id,
    required String flowId,
    required int orderIndex,
    @Default(true) bool inSync,
    
    // Composition: Hold the actual YogaPose object
    required YogaPose pose,

  }) = _YogaFlowPose;

  factory YogaFlowPose.fromJson(Map<String, dynamic> json) => _$YogaFlowPoseFromJson(json);
}
```

### `YogaSessionPose`
**File:** `lib/models/sessions/yoga_session_pose.dart`
```dart
import 'package.freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/models/poses/yoga_pose.dart';

part 'yoga_session_pose.freezed.dart';
part 'yoga_session_pose.g.dart';

@freezed
abstract class YogaSessionPose with _$YogaSessionPose {
  @JsonSerializable(explicitToJson: true)
  const factory YogaSessionPose({
    required String id,
    required String sessionId,
    required int orderIndex,
    @Default(true) bool inSync,

    // Composition: Hold the actual YogaPose object
    required YogaPose pose,

  }) = _YogaSessionPose;

  factory YogaSessionPose.fromJson(Map<String, dynamic> json) => _$YogaSessionPoseFromJson(json);
}
```

### `YogaSessionFlow`
**File:** `lib/models/sessions/yoga_session_flow.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yogasessions/models/flows/yoga_flow.dart';

part 'yoga_session_flow.freezed.dart';
part 'yoga_session_flow.g.dart';

@freezed
abstract class YogaSessionFlow with _$YogaSessionFlow {
  @JsonSerializable(explicitToJson: true)
  const factory YogaSessionFlow({
    required String id,
    required String sessionId,
    required int orderIndex,
    @Default(true) bool inSync,

    // Composition: Hold the actual YogaFlow object
    required YogaFlow flow,

  }) = _YogaSessionFlow;

  factory YogaSessionFlow.fromJson(Map<String, dynamic> json) => _$YogaSessionFlowFromJson(json);
}
```

## 6. Update `User` Model

**Why:** The existing `User` model is a plain Dart class. Converting it to a `freezed` class ensures it follows the same modern, immutable pattern as the other data models, simplifying serialization and state management.

**File:** `lib/models/user.dart`
```dart
import 'package.freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    String? email,
    String? displayName,
    String? photoUrl,
    @Default(false) bool isEmailVerified,
    @Default(false) bool isAdmin,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
```

## 7. Deprecate `base_model.dart`

**Why:** The new `freezed` models all define their own properties (like `id` and `name`), making the abstract `BaseModel` class redundant. It no longer serves a purpose and can be safely removed to clean up the codebase.
```
This file should be deleted.
```
