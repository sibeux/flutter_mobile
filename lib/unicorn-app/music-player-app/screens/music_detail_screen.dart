import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/providers/play_music_providers.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/capitalize.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

class MusicDetailScreen extends ConsumerStatefulWidget {
  const MusicDetailScreen({super.key, required this.music});

  final Music music;

  @override
  ConsumerState<MusicDetailScreen> createState() => _MusicDetailScreenState();
}

class _MusicDetailScreenState extends ConsumerState<MusicDetailScreen> {
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
                  height: 20,
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
                  height: 25,
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
                  height: 40,
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
                      min: 0,
                      max: 100,
                      value: 12,
                      activeColor: HexColor('#fefffe'),
                      inactiveColor: HexColor('#726878'),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                            } else {
                              ref.read(playMusicProvider.notifier).onPlayMusic(
                                    Icons.pause_circle_filled,
                                  );
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
                        onPressed: () {},
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
}
