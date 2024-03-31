import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/music_list.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  Future getMusisData() async {
    const url =
        'https://sibeux.my.id/cloud-music-player/database/mobile-music-player/api/db.php';
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
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
                  child: FutureBuilder(
                      future: getMusisData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                        }
                        return snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data.length,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return MusicList(
                                    numberMusic: index + 1,
                                  );
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
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
