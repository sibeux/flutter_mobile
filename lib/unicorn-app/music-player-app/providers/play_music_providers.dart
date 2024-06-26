import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';
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
class MusikDimainkanNotifier extends StateNotifier<Music> {
  MusikDimainkanNotifier()
      : super(const Music(
            id: "",
            title: "",
            artist: "",
            album: "",
            cover: "",
            url: "",
            duration: "",
            isFavorite: ""));

  void mainkanMusik(Music music) {
    state = music;
  }
}

final musikDimainkanProvider =
    StateNotifierProvider<MusikDimainkanNotifier, Music>((ref) {
  return MusikDimainkanNotifier();
});

// boolean isPlaying
class IsPlayingNotifier extends StateNotifier<bool> {
  IsPlayingNotifier() : super(false);

  void onPlayMusic(bool isPlaying) {
    state = isPlaying;
  }
}

final isPlayingProvider = StateNotifierProvider<IsPlayingNotifier, bool>((ref) {
  return IsPlayingNotifier();
});

// array of shuffle music
class ShuffleMusicNotifier extends StateNotifier<List<int>> {
  ShuffleMusicNotifier() : super([]);

  void onShuffleMusic(List<int> musics) {
    state = musics;
  }
}

final shuffleMusicProvider =
    StateNotifierProvider<ShuffleMusicNotifier, List<int>>((ref) {
  return ShuffleMusicNotifier();
});