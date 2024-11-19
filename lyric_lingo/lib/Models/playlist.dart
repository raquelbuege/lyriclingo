import 'package:lyric_lingo/Models/song_model.dart';

class Playlist{
  String id;
  String name;
  int numberOftracks;
  Song currentSong;
  Song previousSong;
  Song nextSong;
  List<Song> songs;

  Playlist({
    required this.id,
    required this.name,
    required this.numberOftracks,
    required this.currentSong,
    required this.previousSong,
    required this.nextSong,
    required this.songs
  });
}