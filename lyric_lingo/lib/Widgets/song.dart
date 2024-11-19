import 'package:flutter/material.dart';
import 'package:lyric_lingo/Models/song_model.dart';

class SongWidget extends StatelessWidget {

  final Song song;

  const SongWidget
  ({
    super.key,
    required this.song,
  });
  
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: const Color.fromARGB(255, 237, 232, 221),
      tileColor: const Color.fromARGB(255, 133, 121, 139),
      leading: Image.asset(song.cover),
      title: Text(song.name),
      subtitle: Text(song.artists.join(', ')),
      trailing: IconButton(
        onPressed: () {
          print("go into artist");
        },
        color: const Color.fromARGB(255, 237, 232, 221),
        icon: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}