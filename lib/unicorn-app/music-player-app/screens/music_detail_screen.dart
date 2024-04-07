import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/music_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicDetailScreen extends ConsumerStatefulWidget {
  const MusicDetailScreen({
    super.key,
    required this.audioPlayer,
    required this.listMusic,
  });

  final AudioPlayer audioPlayer;
  final List<Music> listMusic;

  @override
  ConsumerState<MusicDetailScreen> createState() => _MusicDetailScreenState();
}

class _MusicDetailScreenState extends ConsumerState<MusicDetailScreen> {
  AudioPlayer get player => widget.audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MusicDetail(
        player: player,
        listMusic: widget.listMusic,
      ),
    );
  }
}
