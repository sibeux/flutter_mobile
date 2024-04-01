import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/models/music.dart';

class MusicDetailScreen extends StatefulWidget {
  const MusicDetailScreen({super.key, required this.music});

  final Music music;

  @override
  State<MusicDetailScreen> createState() => _MusicDetailScreenState();
}

class _MusicDetailScreenState extends State<MusicDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaY: 35,
                sigmaX: 35,
              ),
              child: Image(
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
                color: Colors.black.withOpacity(0.6),
                colorBlendMode: BlendMode.darken,
                image: NetworkImage(
                  widget.music.cover,
                  scale: 5,
                ),
              )),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      filterQuality: FilterQuality.low,
                      image: NetworkImage(widget.music.cover),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.music.title,
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
                  widget.music.artist,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
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
                        icon: const Icon(
                          Icons.play_circle_fill,
                          size: 60,
                          color: Colors.white,
                        ),
                        onPressed: () {},
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
