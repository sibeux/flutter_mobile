// ignore_for_file: unnecessary_import, implementation_imports, sort_child_properties_last, prefer_const_constructors, sized_box_for_whitespace, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;

  const Answer({
    super.key,
    required this.selectHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          selectHandler();
        },
        child: Text("Answer 1"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
      ),
    );
  }
}
