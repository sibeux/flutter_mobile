import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/screens/music.dart';

class MainMusicPlayerApp extends StatelessWidget {
  const MainMusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    return const MaterialApp(
      home: MusicScreen(),
    );
  }
}
