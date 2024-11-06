class SongModel {
  String id;
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
}