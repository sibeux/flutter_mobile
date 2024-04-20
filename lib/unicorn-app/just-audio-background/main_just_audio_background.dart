import 'package:flutter/material.dart';
import 'package:flutter_mobile/unicorn-app/just-audio-background/provider/audio_state.dart';
import 'package:flutter_mobile/unicorn-app/just-audio-background/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MainJustAudioBackgroundApp extends StatelessWidget {
  const MainJustAudioBackgroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (_) => AudioState(),
      child: MaterialApp(
        title: 'Just Audio Background',
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
