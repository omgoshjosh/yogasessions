class YogaPose {
  final String id;
  final String name;
  final String description;
  final String? sanskritName;
  final String? imageUrl;

  YogaPose({
    required this.id,
    required this.name,
    required this.description,
    this.sanskritName,
    this.imageUrl,
  });

  // You might want to add factory constructors for fromJson/toJson later
  // for data persistence and API communication.
}