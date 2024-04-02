import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/chat_app/screens/auth.dart';

class MainChatApp extends StatelessWidget {
  const MainChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 17, 177)),
      ),
      home: const AuthScreen()
    );
  }
}