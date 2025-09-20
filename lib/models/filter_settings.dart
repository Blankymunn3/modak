class FilterSettings {
  final List<String> campingTypes;
  final List<String> amenities;
  final double? minRating;
  final double? maxDistance;

  FilterSettings({
    required this.campingTypes,
    required this.amenities,
    this.minRating,
    this.maxDistance,
  });

  factory FilterSettings.empty() {
    return FilterSettings(
      campingTypes: [],
      amenities: [],
    );
  }

  factory FilterSettings.fromJson(Map<String, dynamic> json) {
    return FilterSettings(
      campingTypes: List<String>.from(json['campingTypes'] as List),
      amenities: List<String>.from(json['amenities'] as List),
      minRating: json['minRating'] as double?,
      maxDistance: json['maxDistance'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'campingTypes': campingTypes,
      'amenities': amenities,
      'minRating': minRating,
      'maxDistance': maxDistance,
    };
  }

  FilterSettings copyWith({
    List<String>? campingTypes,
    List<String>? amenities,
    double? minRating,
    double? maxDistance,
  }) {
    return FilterSettings(
      campingTypes: campingTypes ?? this.campingTypes,
      amenities: amenities ?? this.amenities,
      minRating: minRating ?? this.minRating,
      maxDistance: maxDistance ?? this.maxDistance,
    );
  }
}