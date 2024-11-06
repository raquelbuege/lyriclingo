class PlaylistModel{
  String id;
  String name;
  int numberOftracks;
  String currentSong;
  String previousSong;
  String nextSong;
  PlaylistModel({
    required this.id,
    required this.name,
    required this.numberOftracks,
    required this.currentSong,
    required this.previousSong,
    required this.nextSong,
  });
}