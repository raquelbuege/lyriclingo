import 'playlist_model.dart';

class UserModel{
  static int idCounter =0; //makes a unique id for each user
  int id;
  String name;
  String spotifyUsername;
  String spotifypsw;
  String? userRefreshToken; //used to keep user logged in if they have previously
  String nativeLanguage;
  String targetLanguage;
  List<PlaylistModel>? playlists;
  List<String>? genrePreferences;

  UserModel({
    required this.name,
    required this.spotifyUsername,
    required this.spotifypsw,
    required this.nativeLanguage,
    required this.targetLanguage,
  }) :id = idCounter++;
}