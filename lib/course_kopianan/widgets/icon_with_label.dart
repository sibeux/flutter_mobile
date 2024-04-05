import 'package:flutter/material.dart';

class IconWithLabel extends StatelessWidget {
  const IconWithLabel({
    super.key,
    required this.icon,
    required this.text,
    required this.colorIcon,
    required this.colortext,
  });

  final IconData icon;
  final String text;
  final Color colorIcon;
  final Color colortext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 30,
          color: colorIcon,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(color: colortext),
        ),
      ],
    );
  }
}