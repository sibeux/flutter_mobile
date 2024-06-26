import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

class CurrentMusicInfo extends StatelessWidget {
  const CurrentMusicInfo({super.key, required this.mediaItem});

  final MediaItem mediaItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Image.network(
                mediaItem.artUri.toString(),
              ),
            ),
          ),
        ),
        Text(
          mediaItem.album ?? '',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          mediaItem.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
