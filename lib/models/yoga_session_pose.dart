class YogaSessionPose {
  final String id; // Unique ID for this instance in the session
  final String originalYogaPoseId; // ID of the YogaPose it was based on

  String name; // Initially copied from YogaPose, editable if isCustom = true
  String description; // Initially copied, editable if isCustom = true
  String? sanskritName; // Initially copied, editable if isCustom = true
  String? imageUrl; // Initially copied, editable if isCustom = true

  int durationInSeconds;
  bool isCustom;

  YogaSessionPose({
    required this.id,
    required this.originalYogaPoseId,
    required this.name,
    required this.description,
    this.sanskritName,
    this.imageUrl,
    required this.durationInSeconds,
    this.isCustom = false, // Defaults to false
  });

// When creating a YogaSessionPose from a YogaPose:
// 1. Populate 'name', 'description', 'sanskritName', 'imageUrl' from the YogaPose.
// 2. Set 'originalYogaPoseId' to the YogaPose's ID.
// 3. Set 'durationInSeconds' as specified by the user for this session.
// 4. 'isCustom' remains false.
//
// If the user later modifies details of this YogaSessionPose (e.g., changes the name
// or description for this session only), you would:
// 1. Update the respective fields (name, description, etc.).
// 2. Set 'isCustom = true'.
}