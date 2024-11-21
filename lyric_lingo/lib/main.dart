import 'package:flutter/material.dart';
import 'package:lyric_lingo/Screens/home_page_view.dart';
import 'package:lyric_lingo/Screens/weekly_playlist.dart';
import 'package:lyric_lingo/repository/spotify_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Calls the connection to spotify for our app and potential user
      home: const ConnectionSpotify(),
      // sources: // https://alan.app/docs/tutorials/flutter/navigating-flutter/
      initialRoute: '/',
      routes: {
        '/second': (context) => const HomePageView(),
      }
    );
  }
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
    spotifyAuthentication();
  }

  //calling the authenicate and log in functionalities in spotify repo that then connects to main activity in android/app
  Future<void> spotifyAuthentication() async {
    try {
      await spotifyRepository.authenticateConnection();
      
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


//display of it
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spotify Connection')),
      body: Center(
        child: Text(status, style: const TextStyle(fontSize: 20)),
      ),
      
    );
  }
}