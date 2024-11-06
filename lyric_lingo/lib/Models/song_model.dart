class SongModel {
  String id;
  String name;
  String language;
  String[] artists;
  Float duration;
  Bool explicit;
  String[] lyrics;

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