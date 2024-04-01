import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/screens/music_detail_screen.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/widgets/capitalize.dart';
import 'package:hexcolor/hexcolor.dart';

class MusicList extends StatelessWidget {
  const MusicList({
    super.key,
    required this.music, required this.numberMusic,
  });

  final Music music;
  final int numberMusic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 18),
                  child: Text(
                    numberMusic.toString().padLeft(2, '0'),
                    style: TextStyle(
                        fontSize: 15,
                        color: HexColor('#8d8c8c'),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 230,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        capitalizeEachWord(music.title),
                        style: TextStyle(
                            fontSize: 16,
                            color: HexColor('#313031'),
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 230,
                      height: 20,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 10,
                            height: 30,
                            child: Icon(
                              Icons.audiotrack_outlined,
                              color: HexColor('#b4b5b4'),
                              size: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Expanded(
                              child: Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              style: TextStyle(
                                fontSize: 13,
                                color: HexColor('#b4b5b4'),
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.values[4],
                              ),
                              '${capitalizeEachWord(music.artist)} | ${capitalizeEachWord(music.album)}',
                            ),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                IconButton(
                  highlightColor: Colors.black.withOpacity(0.02),
                  icon: Icon(
                    Icons.more_vert_sharp,
                    size: 30,
                    color: HexColor('#b5b5b4'),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 18, right: 10),
              width: double.infinity,
              height: 1,
              color: HexColor('#e0e0e0').withOpacity(0.7),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return MusicDetailScreen(music: music);
          },
        ));
      },
    );
  }
}