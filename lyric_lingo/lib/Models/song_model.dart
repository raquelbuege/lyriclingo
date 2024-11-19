class Song {
  int id;
  String name;
  String language;
  List<String> artists;
  double duration;  // Using double instead of Float for Dart
  bool explicit;
  List<String> lyrics;
  String cover;

  Song ({
    required this.id,
    required this.name,
    required this.language,
    required this.artists,
    required this.duration,
    required this.explicit,
    required this.lyrics,
    required this.cover,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'language': language,
    'artists': artists,
    'duration': duration,
    'explicit': explicit,
    'lyrics': lyrics,
    'cover' : cover,
  };

  factory Song.fromJson(Map<String, dynamic> json) => Song(
    id: json['id'],
    name: json['name'],
    language: json['language'],
    artists: List<String>.from(json['artists']),
    duration: (json['duration']).toDouble(),
    explicit: json['explicit'],
    lyrics: List<String>.from(json['lyrics']),
    cover: json['cover'],
  );
}