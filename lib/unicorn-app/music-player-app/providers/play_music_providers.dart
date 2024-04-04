import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Untuk mengubah icon play/pause
class PlayMusicNotifier extends StateNotifier<IconData> {
  PlayMusicNotifier() : super(Icons.pause_circle_filled);

  void onPlayMusic(IconData icon) {
    state = (icon);
  }
}

final playMusicProvider =
    StateNotifierProvider<PlayMusicNotifier, IconData>((ref) {
  return PlayMusicNotifier();
});


// Untuk mengetahui musik mana yang sedang dimainkan
class MusikDimainkanNotifier extends StateNotifier<String> {
  MusikDimainkanNotifier() : super("");

  void mainkanMusik(String musicId) {
    state = musicId;
  }
}

final musikDimainkanProvider =
    StateNotifierProvider<MusikDimainkanNotifier, String>((ref) {
  return MusikDimainkanNotifier();
});
