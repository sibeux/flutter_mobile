import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
    required this.title,
    // kita kasih nilai default jika gada required
    this.button = "def",
  });

  final String title;
  final String button;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            // bentuk if di widget, kaya ternary option
            (button == "def" ? "Button Default" : button),
          )),
    );
  }
}
