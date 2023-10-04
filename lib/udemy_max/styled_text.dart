import 'package:flutter/material.dart';

class GayaTeks extends StatelessWidget {
  const GayaTeks(
    {
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        color: Colors.white,
      ),
    );
  }
}
