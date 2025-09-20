class JournalEntry {
  final String id;
  final String title;
  final String location;
  final DateTime date;
  final String type;
  final String weather;
  final double temperature;
  final int duration;
  final List<String> photos;
  final String content;
  final DateTime createdAt;

  JournalEntry({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.type,
    required this.weather,
    required this.temperature,
    required this.duration,
    required this.photos,
    required this.content,
    required this.createdAt,
  });

  factory JournalEntry.fromJson(Map<String, dynamic> json) {
    return JournalEntry(
      id: json['id'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      date: DateTime.parse(json['date'] as String),
      type: json['type'] as String,
      weather: json['weather'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      duration: json['duration'] as int,
      photos: List<String>.from(json['photos'] as List),
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'date': date.toIso8601String(),
      'type': type,
      'weather': weather,
      'temperature': temperature,
      'duration': duration,
      'photos': photos,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}