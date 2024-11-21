import 'package:flutter/material.dart';
import 'package:lyric_lingo/Models/playlist.dart';
import 'package:lyric_lingo/repository/spotify_repository.dart';

class PlaylistViewModel extends ChangeNotifier {

  late Playlist playlist;

  Future<void> loadPlaylist() async {}
}
  

class ConnectionSpotify extends StatefulWidget {
  const ConnectionSpotify({super.key});

  @override
  //creating the connection spotify pages widget's state 
  ConnectionSpotifyPageState createState() => ConnectionSpotifyPageState();
}

class ConnectionSpotifyPageState extends State<ConnectionSpotify> {
  //creating an instance of our spotifyRepo
  final SpotifyRepository spotifyRepository = SpotifyRepository();
  String status = "Not authenticated";

  //intializing it
  @override
  void initState() {
    super.initState();
    getPlaylistPreferences();
  }

  //calling the authenicate and log in functionalities in spotify repo that then connects to main activity in android/app
  Future<void> getPlaylistPreferences() async {
    try {
      await spotifyRepository.generatePreference();
      setState(() {
        
        // https://alan.app/docs/tutorials/flutter/navigating-flutter/
        Navigator.pushNamed(context, '/second');
        //spotifyRepository.generatePreference();
      });
     
    } catch (e) {
      setState(() {
        status = "Connection failed: $e";
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}
