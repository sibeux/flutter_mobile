import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/screens/music_screen.dart';

class MainMusicPlayerApp extends StatelessWidget {
  const MainMusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MusicScreen(),
    );
  }
}
