// ignore_for_file: avoid_print, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_mobile/answer.dart';
import './question.dart';
import 'course_kopianan/main_anan.dart';

void main() {
  runApp(MyAppAnan());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState

    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite Animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex],
            ),
            Answer(selectHandler: _answerQuestion),
            Answer(selectHandler: _answerQuestion),
            Answer(selectHandler: _answerQuestion),
          ],
        ),
      ),
    );
  }
}
