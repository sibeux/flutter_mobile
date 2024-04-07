// Untuk mengetahui musik mana yang sedang dimainkan
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListMusikNotifier extends StateNotifier<List<Music>> {
  ListMusikNotifier() : super([]);

  void addMusic(List<Music> music) {
    state = music;
  }
}

final listMusikProvider =
    StateNotifierProvider<ListMusikNotifier, List<Music>>((ref) {
  return ListMusikNotifier();
});
