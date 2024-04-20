import 'package:audio_service/audio_service.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class AudioState extends ChangeNotifier {
  late AudioPlayer player;
  static int _nextMediaId = 0;

  final playList = ConcatenatingAudioSource(
    children: [
      ClippingAudioSource(
        start: const Duration(seconds: 60),
        end: const Duration(seconds: 90),
        child: AudioSource.uri(
          Uri.parse(
              "https://raw.githubusercontent.com/sibeux/sibeux-contrarians-syntaxianz/main/The%20BabyStars/spotifydown.com%20-%20REMEMBER.mp3"),
        ),
        tag: MediaItem(
          id: '${_nextMediaId++}',
          title: 'REMEMBER',
          artist: 'Coldrain',
          album: 'The BabyStars',
          artUri: Uri.parse(
              "https://i.scdn.co/image/ab67616d0000b2739230f7c8dfff664d6ac2ad0b"),
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://raw.githubusercontent.com/sibeux/sibeux-contrarians-syntaxianz/main/The%20BabyStars/spotifydown.com%20-%20REMEMBER.mp3"),
        tag: MediaItem(
          id: '${_nextMediaId++}',
          title: '7:3',
          artist: 'Alisa Okehazama',
          album: 'Jujutsu Kaisen',
          artUri: Uri.parse(
              "https://i.scdn.co/image/ab67616d0000b2739230f7c8dfff664d6ac2ad0b"),
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://raw.githubusercontent.com/sibeux/sibeux-contrarians-syntaxianz/main/The%20BabyStars/spotifydown.com%20-%20REMEMBER.mp3"),
        tag: MediaItem(
          id: '${_nextMediaId++}',
          title: '7:3',
          artist: 'Alisa Okehazama',
          album: 'Jujutsu Kaisen',
          artUri: Uri.parse(
              "https://i.scdn.co/image/ab67616d0000b2739230f7c8dfff664d6ac2ad0b"),
        ),
      ),
    ],
  );

  AudioState() {
    player = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    player.playbackEventStream.listen(
      (event) {},
      onError: (Object e, StackTrace stackTrace) {
        logger.e('A stream error occurred: $e');
      },
    );
    try {
      await player.setAudioSource(playList);
    } catch (e) {
      logger.e('Error loading audio source: $e');
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
