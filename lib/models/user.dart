class User {
  final String id;
  final String? email;
  final String? password;
  final String? displayName;
  final String? photoUrl;
  final bool? isEmailVerified;
  final bool? isAdmin;

  User({
    required this.id,
    this.email,
    this.password,
    this.displayName,
    this.photoUrl,
    this.isEmailVerified,
    this.isAdmin,
  });

  // You might want to add factory constructors for fromJson/toJson later
  // for data persistence and API communication.
}