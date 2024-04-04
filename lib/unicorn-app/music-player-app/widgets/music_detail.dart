import 'dart:async';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/providers/play_music_providers.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/capitalize.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

class MusicDetail extends ConsumerStatefulWidget {
  const MusicDetail({super.key, required this.music, required this.player});

  final Music music;
  final AudioPlayer player;

  @override
  ConsumerState<MusicDetail> createState() => _MusicDetailState();
}

class _MusicDetailState extends ConsumerState<MusicDetail> {
  Duration? duration;
  Duration? position;

  String formatDuration(Duration? duration) {
    if (duration == null) return '00:00';
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  String get _durationText => formatDuration(duration);

  String get _positionText => formatDuration(position);

  AudioPlayer get player => widget.player;

  @override
  void initState() {
    super.initState();
    // Use initial values from player
    player.getDuration().then(
          (value) => setState(() {
            duration = value;
          }),
        );
    player.getCurrentPosition().then(
          (value) => setState(() {
            position = value;
          }),
        );
    _initStreams();
  }

  @override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();

    // jika ada ini, maka audio player akan dihentikan ketika screen kembali ke screen sebelumnya
    _stop();
    // player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playMusic = ref.watch(playMusicProvider);

    return Stack(
      children: [
        Stack(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                // ClipRRect is used to clip the image to a rounded rectangle
                // awikwok banget nih, kalo ga pake ClipRRect, gambarnya bakal melebar melebihi ukuran layar
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaY: 35,
                    sigmaX: 35,
                  ),
                  child: Image.network(
                    widget.music.cover,
                    scale: 5,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                    color: Colors.black.withOpacity(0.5),
                    colorBlendMode: BlendMode.darken,
                    errorBuilder: (context, exception, stackTrace) {
                      return Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 126, 248, 60),
                              Color.fromARGB(255, 253, 123, 123),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 340,
                  height: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.music.cover,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Shimmer(
                          gradient: const LinearGradient(
                            colors: [Colors.grey, Colors.white],
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.grey,
                          ),
                        );
                      },
                      errorBuilder: (context, exception, stackTrace) {
                        return Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.grey,
                            child: const Icon(
                              Icons.music_note_rounded,
                              color: Colors.white,
                              size: 50,
                            ));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    capitalizeEachWord(widget.music.title),
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.values[5],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  capitalizeEachWord(widget.music.artist),
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // child: Divider(
                  //   color: Colors.white,
                  //   thickness: 1,
                  child: SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 1,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                    ),
                    child: Slider(
                      value: (position != null &&
                              duration != null &&
                              position!.inMilliseconds > 0 &&
                              position!.inMilliseconds <
                                  duration!.inMilliseconds)
                          ? position!.inMilliseconds / duration!.inMilliseconds
                          : 0.0,
                      activeColor: HexColor('#fefffe'),
                      inactiveColor: HexColor('#726878'),
                      onChanged: (value) {
                        final durasi = duration;
                        if (durasi == null) {
                          return;
                        }
                        final position = value * durasi.inMilliseconds;
                        player.seek(Duration(milliseconds: position.round()));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _positionText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        _durationText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.repeat,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.skip_previous,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(
                          playMusic,
                          size: 60,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (playMusic == Icons.pause_circle_filled) {
                              ref.read(playMusicProvider.notifier).onPlayMusic(
                                    Icons.play_circle_fill,
                                  );
                              _pause();
                            } else {
                              ref.read(playMusicProvider.notifier).onPlayMusic(
                                    Icons.pause_circle_filled,
                                  );
                              _play();
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.skip_next,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.list_alt,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          ref.read(playMusicProvider.notifier).onPlayMusic(
                                Icons.play_circle_fill,
                              );
                          _stop();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _initStreams() {
    _durationSubscription = player.onDurationChanged.listen((durasi) {
      setState(() => duration = durasi);
    });

    _positionSubscription = player.onPositionChanged.listen(
      (p) => setState(() => position = p),
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      setState(() {
        position = Duration.zero;
      });
    });

  }

  Future<void> _play() async {
    await player.resume();
  }

  Future<void> _pause() async {
    await player.pause();
  }

  Future<void> _stop() async {
    await player.stop();
    setState(() {
      position = Duration.zero;
    });
  }
}
