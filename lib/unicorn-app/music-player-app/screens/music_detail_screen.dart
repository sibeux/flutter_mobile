import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/music_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicDetailScreen extends ConsumerStatefulWidget {
  const MusicDetailScreen(
      {super.key, required this.music, required this.audioPlayer});

  final Music music;
  final AudioPlayer audioPlayer;

  @override
  ConsumerState<MusicDetailScreen> createState() => _MusicDetailScreenState();
}

class _MusicDetailScreenState extends ConsumerState<MusicDetailScreen> {
  Music get music => widget.music;
  AudioPlayer get player => widget.audioPlayer;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: MusicDetail(
        currentMusic: music,
        player: player,
      ),
    );
  }
}
