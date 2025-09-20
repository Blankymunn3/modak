class User {
  final String id;
  final String name;
  final String email;
  final String? profileImageUrl;
  final int campingCount;
  final DateTime joinDate;
  final List<String> favoriteSpots;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl,
    required this.campingCount,
    required this.joinDate,
    required this.favoriteSpots,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      campingCount: json['campingCount'] as int,
      joinDate: DateTime.parse(json['joinDate'] as String),
      favoriteSpots: List<String>.from(json['favoriteSpots'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'campingCount': campingCount,
      'joinDate': joinDate.toIso8601String(),
      'favoriteSpots': favoriteSpots,
    };
  }
}