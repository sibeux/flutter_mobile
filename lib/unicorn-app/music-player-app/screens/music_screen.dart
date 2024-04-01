import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/screens/music_detail_screen.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/music_list.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/shimmer_music_list.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:page_transition/page_transition.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  String? _error;
  var isLoading = true;
  List<Music> _musicItems = [];
  bool isLoadingVertical = false;
  final int increment = 10;

  @override
  void initState() {
    super.initState();
    getMusicData();
    _loadMoreVertical();
  }

  Future _loadMoreVertical() async {
    setState(() {
      isLoadingVertical = true;
    });

    // Add in an artificial delay
    await Future.delayed(
      const Duration(seconds: 2),
    );

    _musicItems.addAll(
      List.generate(
        increment,
        (index) => Music(
          id: _musicItems[_musicItems.length + index].id,
          title: _musicItems[_musicItems.length + index].title,
          artist: _musicItems[_musicItems.length + index].artist,
          album: _musicItems[_musicItems.length + index].album,
          cover: _musicItems[_musicItems.length + index].cover,
          url: _musicItems[_musicItems.length + index].url,
          duration: _musicItems[_musicItems.length + index].duration,
          isFavorite: _musicItems[_musicItems.length + index].isFavorite,
        ),
      ),
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
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  duration: const Duration(milliseconds: 300),
                  reverseDuration: const Duration(milliseconds: 300),
                  child: MusicDetailScreen(
                    music: _musicItems[index],
                  ),
                  childCurrent: const MusicScreen(),
                ),
              ),
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
      body: Row(
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
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
                ))
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
    );
  }
}
