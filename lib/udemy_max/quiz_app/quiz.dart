import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

@override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.blue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: const StartScreen(),
        ),
      ),
    );
  }
}