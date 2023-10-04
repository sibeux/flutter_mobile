import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/gradient_container.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colorTop: Colors.red,
          colorBottom: Colors.blue,
        ),
      ),
    ),
  );
}