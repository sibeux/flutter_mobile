import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/components/dominant_color.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/providers/play_music_providers.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/screens/music_detail_screen.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/capitalize.dart';

import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/music_list.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/shimmer_music_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:page_transition/page_transition.dart';

class MusicScreen extends ConsumerStatefulWidget {
  const MusicScreen({super.key});

  @override
  ConsumerState<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends ConsumerState<MusicScreen> {
  String? _error;
  var isLoading = true;
  List<Music> _musicItems = [];
  bool isLoadingVertical = false;
  final int increment = 10;
  late AudioPlayer player = AudioPlayer();
  Color dominantColor = Colors.transparent;

  StreamSubscription? _playerCompleteSubscription;

  void playMusic(String url) async {
    await player.setSourceUrl(url);
    await player.resume();
  }

  void setColor(Color color) {
    setState(() {
      dominantColor = color;
    });
  }

  @override
  void initState() {
    super.initState();
    getMusicData();
    _loadMoreVertical();

    // Create the audio player.
    player = AudioPlayer();

    // Set the release mode to release the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);

    _initStreams();
  }

  @override
  void dispose() {
    _playerCompleteSubscription?.cancel();
    super.dispose();
  }

  Future _loadMoreVertical() async {
    setState(() {
      isLoadingVertical = true;
    });

    // Add in an artificial delay
    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {
      isLoadingVertical = false;
    });
  }

  void getMusicData() async {
    const url =
        'https://sibeux.my.id/cloud-music-player/database/mobile-music-player/api/db.php';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to load items';
        });
      }

      if (response.body == 'null') {
        setState(() {
          isLoading = false;
        });
        return;
      }

      final List<dynamic> listData = json.decode(response.body);
      final List<Music> loadedItems = [];

      for (final item in listData) {
        loadedItems.add(
          Music(
            id: item['id_music'],
            title: item['title'],
            artist: item['artist'],
            album: item['album'],
            cover: item['cover'],
            url: item['link_gdrive'],
            duration: item['time'],
            isFavorite: item['favorite'],
          ),
        );
      }

      setState(() {
        _musicItems = loadedItems;
        isLoading = false;
      });
    } catch (e) {
      setState(
        () {
          _error = e.toString();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final indexPlayMusic = ref.watch(musikDimainkanProvider);

    Widget content = const Center(
      child: Text('No music yet! Add some!'),
    );

    if (isLoading) {
      content = const ShimmerMusicList();
    }

    if (_musicItems.isNotEmpty) {
      content = LazyLoadScrollView(
        isLoading: isLoadingVertical,
        onEndOfPage: () => _loadMoreVertical(),
        child: ListView.builder(
          itemCount: _musicItems.length,
          physics: const ClampingScrollPhysics(),
          primary: false,
          itemBuilder: (context, index) {
            return InkWell(
              child: MusicList(
                numberMusic: index + 1,
                music: _musicItems[index],
              ),
              onTap: () {
                if (indexPlayMusic.id == "" ||
                    indexPlayMusic.id != _musicItems[index].id) {
                  getDominantColor(_musicItems[index].cover).then((color) {
                    setColor(color!);
                  });

                  ref
                      .read(musikDimainkanProvider.notifier)
                      .mainkanMusik(_musicItems[index]);

                  ref.read(isPlayingProvider.notifier).onPlayMusic(true);

                  playMusic(_musicItems[index].url);
                }

                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    duration: const Duration(milliseconds: 300),
                    reverseDuration: const Duration(milliseconds: 300),
                    child: MusicDetailScreen(
                      audioPlayer: player,
                      listMusic: _musicItems,
                    ),
                    childCurrent: const MusicScreen(),
                  ),
                );
              },
            );
          },
        ),
      );
    }

    if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#fefffe'),
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          tooltip: 'Menu',
          onPressed: () {
            // handle the press
          },
        ),
        centerTitle: true,
        toolbarHeight: 60,
        title: Text(
          'WhatsApp Audio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: HexColor('#1e0b2b'),
            fontSize: 21,
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      color: HexColor('#fefffe'),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              playLaguBaru();

                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  duration: const Duration(milliseconds: 300),
                                  reverseDuration:
                                      const Duration(milliseconds: 300),
                                  child: MusicDetailScreen(
                                    audioPlayer: player,
                                    listMusic: _musicItems,
                                  ),
                                  childCurrent: const MusicScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              margin: const EdgeInsets.only(left: 18),
                              width: 180,
                              height: 35,
                              decoration: BoxDecoration(
                                color: HexColor('#ac8bc9'),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.play_circle_fill,
                                    color: HexColor('#fefffe'),
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Shuffle Playback',
                                    style: TextStyle(
                                      color: HexColor('#fefffe'),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          IconButton(
                            highlightColor: Colors.black.withOpacity(0.02),
                            icon: Icon(
                              Icons.list_rounded,
                              size: 30,
                              color: HexColor('#8d8c8c'),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: HexColor('#fefffe'),
                        padding: const EdgeInsets.only(top: 8),
                        width: double.infinity,
                        child: content,
                        // FutureBuilder(
                        //     future: getMusicData(),
                        //     builder: (context, snapshot) {
                        //       if (snapshot.hasError) {
                        //         print(snapshot.error);
                        //       }
                        //       return content;
                        //     }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                width: 30,
                height: double.infinity,
              )
            ],
          ),
        ),
        if (ref.watch(musikDimainkanProvider).id.isNotEmpty)
          GestureDetector(
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 45,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.grey,
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                              color: dominantColor,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomRight: Radius.circular(100)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    capitalizeEachWord(ref
                                        .watch(musikDimainkanProvider)
                                        .title),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    capitalizeEachWord(ref
                                        .watch(musikDimainkanProvider)
                                        .artist),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                ref.watch(musikDimainkanProvider).cover,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  duration: const Duration(milliseconds: 300),
                  reverseDuration: const Duration(milliseconds: 300),
                  child: MusicDetailScreen(
                    audioPlayer: player,
                    listMusic: _musicItems,
                  ),
                  childCurrent: const MusicScreen(),
                ),
              );
            },
          )
      ]),
    );
  }

  void _initStreams() {
    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      playLaguBaru();
    });
  }

  void playLaguBaru() {
    final int index = random(0, _musicItems.length);

    final lagu = _musicItems[index];

    ref.read(musikDimainkanProvider.notifier).mainkanMusik(lagu);

    ref.read(isPlayingProvider.notifier).onPlayMusic(true);

    getDominantColor(lagu.cover).then((color) {
      setColor(color!);
    });

    playMusic(lagu.url);
  }

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
