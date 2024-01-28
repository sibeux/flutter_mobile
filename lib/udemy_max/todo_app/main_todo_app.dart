import 'package:flutter/material.dart';
// import 'package:flutter_mobile/udemy_max/todo_app/ui_updates_demo.dart';
import 'package:flutter_mobile/udemy_max/todo_app/keys/keys.dart';

class MainTodoApp extends StatelessWidget {
  const MainTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Internals'),
        ),
        // body: const UIUpdatesDemo(),
        body: const Keys(),
      ),
    );
  }
}
