import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayMusicNotifier extends StateNotifier<IconData> {
  PlayMusicNotifier() : super(Icons.play_circle_fill);

  void onPlayMusic(IconData icon) {
    state = (icon);
  }
}

final playMusicProvider =
    StateNotifierProvider<PlayMusicNotifier, IconData>((ref) {
  return PlayMusicNotifier();
});
