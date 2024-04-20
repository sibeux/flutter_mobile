import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/just-audio-background/provider/audio_state.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final audioState = context.watch<AudioState>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Just Audio Background'),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: StreamBuilder<SequenceState?>(
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  if (state?.sequence.isEmpty ?? true) {
                    return const Center(
                      child: SizedBox.shrink(),
                    );
                  }
                  return Container();
                },
                stream: audioState.player.sequenceStateStream,
              ))
            ],
          ),
        ));
  }
}
