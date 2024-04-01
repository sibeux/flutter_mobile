import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayMusicNotifier extends StateNotifier<IconData> {
  PlayMusicNotifier() : super(Icons.play_circle_fill);

  void onPlayMusic(IconData index) {
    state = (index);
  }
}

final playMusicProvider =
    StateNotifierProvider<PlayMusicNotifier, IconData>((ref) {
  return PlayMusicNotifier();
});
