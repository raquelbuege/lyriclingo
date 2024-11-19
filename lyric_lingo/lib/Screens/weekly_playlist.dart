import 'package:flutter/material.dart';
import 'package:lyric_lingo/Models/playlist.dart';
import 'package:lyric_lingo/ViewModel/playlistVM.dart';
import 'package:lyric_lingo/Widgets/playlist.dart';

class PlaylistView extends StatefulWidget {
  const PlaylistView({super.key});

  @override
  _PlaylistViewState createState() => _PlaylistViewState();

}

class _PlaylistViewState extends State<PlaylistView> {

  late PlaylistViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = PlaylistViewModel();
    _viewModel.loadPlaylist();
  }

  // Helper function to calculate week of the year
  int _getWeekOfYear(DateTime date) {
    return (date.day / 7).floor() + 1;
  }

  // This function could be called periodically to refresh the playlist
  void _playPlaylist() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Playlist #${_viewModel.playlist.id}", style: const TextStyle(fontFamily: 'Coolvetica', fontSize: 50),),
        backgroundColor: const Color.fromARGB(255, 53, 45, 57),
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow_rounded),
            onPressed: _playPlaylist,  // Refresh playlist manually if needed
          ),
        ],
      ),
      body: 
      PlaylistItem(playlist: _viewModel.playlist)
    );
  }
}

