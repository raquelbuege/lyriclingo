import 'package:flutter/services.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'dart:convert';

import 'dart:async';
import 'package:http/http.dart' as http;



class SpotifyRepository{
  static const platform = MethodChannel("com.example.lyric_lingo");
  final String clientId = "dbfa6e6ad1e14b0c95765cffe5d98e7b";
  final String clientSecret = "8f336c56a6af4292847c0609d2990926";

 Future<void> authenticateConnection() async {
    try {
      await platform.invokeMethod("authenticate", {
        "clientId": clientId,
        "clientSecret": clientSecret,
      });

      print("Authentication flow started successfully.");

      //Attempting to use the flutter sdk package but not currently working 
      // final accessToken = await SpotifySdk.getAccessToken(clientId: "dbfa6e6ad1e14b0c95765cffe5d98e7b", redirectUrl: "lyriclingoapp://main", scope: "app-remote-control,user-modify-playback-state,playlist-read-private");
      // print(accessToken);

    } on PlatformException catch (e) {
      print("Authentication failed: ${e.message}");
    }
  }
  //Based on the Flutter Spotify sdk 
   Future<String> getAccessToken() async {
    try {
      var authenticationToken = await SpotifySdk.getAccessToken(
          clientId: "dbfa6e6ad1e14b0c95765cffe5d98e7b",
          redirectUrl: "lyriclingoapp://main",
          scope: 'app-remote-control, '
              'user-modify-playback-state, '
              'playlist-read-private, '
              'playlist-modify-public,user-read-currently-playing');
      print('Got a token: $authenticationToken');
      return authenticationToken;
    } on PlatformException catch (e) {
      print(e.code);
      return Future.error('$e.code: $e.message');
    } on MissingPluginException {
      print('not implemented');
      return Future.error('not implemented');
    }
  }

  Future<String?> retrieveToken() async {
    try {
       await platform.invokeMethod("getAccessTokens", {
        "clientId": clientId,
        "clientSecret": clientSecret,
      });
      final String? userToken = await platform.invokeMethod("getAccessToken");
      print("WORKING");
      print("Access token: $userToken");
      return userToken;
    } on PlatformException catch (e) {
      print("Error retrieving token: ${e.message}");
      return null;
    }
  }
  
  //generate genre preference
  Future<String?> generatePreference() async { 
    try{
      await authenticateConnection();
      final accessToken = await retrieveToken();
      print("working!");

    if (accessToken != null) {
      final response = await http.get(
        Uri.parse('https://api.spotify.com/v1/me/top/artists'), 
        headers: {
          'Authorization': 'Bearer $accessToken',  // Use the access token in the Authorization header
        },
      );

    if (response.statusCode == 200) {
      // Successful request
      print('User data: ${jsonDecode(response.body)}');
    } else {
      // Error handling
      print('Failed to fetch user data: ${response.statusCode}');
    }
  } else {
    print('Access token is missing.');
  }
    }catch (e){
      print("errorrrr");
    }
    return null;
  }
    //use user\me\top\type(artist), 5 
    //for each artist we do artist.genre => add to user model genres

  
}



