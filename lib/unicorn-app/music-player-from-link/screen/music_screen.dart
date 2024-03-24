import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-from-link/widgets/player_widget.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  late AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    // Create the audio player.
    audioPlayer = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    audioPlayer.setReleaseMode(ReleaseMode.stop);

    // Start the audioPlayer as soon as the app is displayed.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await audioPlayer.setSourceUrl(
          "https://github.com/sibeux/license-sibeux/raw/MyProgram/%E6%97%A5%E6%9C%AC%E3%81%AE%E6%AD%8C/BURNOUT%20SYNDROMES-%20PHOENIX/BURNOUT%20SYNDROMES-%20PHOENIX.mp3");
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
      appBar: AppBar(
        title: const Text('Simple Player'),
      ),
      body: PlayerWidget(player: audioPlayer),
    );
  }
}
