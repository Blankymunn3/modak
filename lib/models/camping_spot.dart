class CampingSpot {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final String type;
  final double rating;
  final List<String> amenities;
  final String description;
  final List<String> imageUrls;

  CampingSpot({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.type,
    required this.rating,
    required this.amenities,
    required this.description,
    required this.imageUrls,
  });

  factory CampingSpot.fromJson(Map<String, dynamic> json) {
    return CampingSpot(
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      type: json['type'] as String,
      rating: (json['rating'] as num).toDouble(),
      amenities: List<String>.from(json['amenities'] as List),
      description: json['description'] as String,
      imageUrls: List<String>.from(json['imageUrls'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'type': type,
      'rating': rating,
      'amenities': amenities,
      'description': description,
      'imageUrls': imageUrls,
    };
  }
}