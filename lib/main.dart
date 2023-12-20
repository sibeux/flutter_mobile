import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/dice_roller/gradient_container.dart';
import 'package:flutter_mobile/udemy_max/quiz_app/start_screen.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
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

        // body: GradientContainer(
        //   colorTop: Colors.red,
        //   colorBottom: Colors.blue,
        // ),
      ),
    ),
  );
}
