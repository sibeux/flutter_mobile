import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key, required this.player});

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: player.sequenceStateStream,
          builder: ((context, snapshot) => IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: player.hasPrevious ? player.seekToPrevious : null,
              )),
        ),
        StreamBuilder<PlayerState?>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: const CircularProgressIndicator(),
              );
            }
            if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 64.0,
                onPressed: player.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: const Icon(Icons.pause),
                iconSize: 64.0,
                onPressed: player.pause,
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.replay),
                iconSize: 64.0,
                onPressed: () => player.seek(
                  Duration.zero,
                  index: player.effectiveIndices!.first,
                ),
              );
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: player.sequenceStateStream,
          builder: ((context, snapshot) => IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: player.hasNext ? player.seekToNext : null,
              )),
        )
      ],
    );
  }
}
