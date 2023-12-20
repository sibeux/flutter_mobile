// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/dice_roller/gradient_container.dart';

class MainDiceRollerApp extends StatelessWidget {
  const MainDiceRollerApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colorTop: Colors.red,
          colorBottom: Colors.blue,
        ),
      ),
    );
  }
}
