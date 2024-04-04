import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/music_detail.dart';

class MusicDetailScreen extends StatefulWidget {
  const MusicDetailScreen({super.key, required this.music});

  final Music music;

  @override
  State<MusicDetailScreen> createState() => _MusicDetailScreenState();
}

class _MusicDetailScreenState extends State<MusicDetailScreen> {
  late AudioPlayer audioPlayer = AudioPlayer();

  Music get music => widget.music;

  @override
  void initState() {
    super.initState();

    // Create the audio player.
    audioPlayer = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    audioPlayer.setReleaseMode(ReleaseMode.stop);

    // Start the audioPlayer as soon as the app is displayed.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await audioPlayer.setSourceUrl(music.url);
      await audioPlayer.resume();
    });
  }

  @override
  void dispose() {
    // Release all sources and dispose the player.
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MusicDetail(music: music, player: audioPlayer),
    );
  }
}
