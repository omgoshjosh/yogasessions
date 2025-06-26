abstract class BaseModel {
  final String id;
  final String? originalId; // If not null, this entity is a copy of the one with originalId
  final String creatorUserId; // User ID of the creator, "-1" for system/seed data
  final bool isPublished;     // True if visible in a public/featured library

  BaseModel({
    required this.id,
    this.originalId,
    required this.creatorUserId,
    required this.isPublished,
  });
}
