class SongModel {
  int id;
  String name;
  String language;
  List<String> artists;
  double duration;  // Using double instead of Float for Dart
  bool explicit;
  List<String> lyrics;

  SongModel({
    required this.id,
    required this.name,
    required this.language,
    required this.artists,
    required this.duration,
    required this.explicit,
    required this.lyrics,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'language': language,
    'artists': artists,
    'duration': duration,
    'explicit': explicit,
    'lyrics': lyrics,
  };

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
    id: json['id'],
    name: json['name'],
    language: json['language'],
    artists: List<String>.from(json['artists']),
    duration: (json['duration']).toDouble(),
    explicit: json['explicit'],
    lyrics: List<String>.from(json['lyrics']),
  );
}