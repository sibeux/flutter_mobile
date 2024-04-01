import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';

class MusicDetailScreen extends StatelessWidget {
  const MusicDetailScreen({super.key, required this.music});

  final Music music;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(music.title),
      ),
    );
  }
}
