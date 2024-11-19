import 'package:flutter/material.dart';
import 'package:lyric_lingo/Models/playlist.dart';
import 'package:lyric_lingo/Widgets/song.dart';

class PlaylistItem extends StatelessWidget {
  final Playlist playlist;
  
  const PlaylistItem({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: playlist.numberOftracks,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final song = playlist.songs.elementAt(index);
        return SongWidget(song: song);
      },
    );
  }
}