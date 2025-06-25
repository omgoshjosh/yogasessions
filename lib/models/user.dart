class User {
  final String id;
  final String? email;
  final String? displayName;
  final String? photoUrl;

  User({
    required this.id,
    this.email,
    this.displayName,
    this.photoUrl,
  });

  // You might want to add factory constructors for fromJson/toJson later
  // for data persistence and API communication.
}