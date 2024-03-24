import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-from-link/screen/music_screen.dart';

class MainMusicApp extends StatelessWidget {
  const MainMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MusicScreen(),
    );
  }
}