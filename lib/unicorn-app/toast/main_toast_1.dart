import 'package:flutter/material.dart';

class MainToastOneApp extends StatelessWidget {
  const MainToastOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast Notification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Show Toast 1'),
          ),
        ],
      ),
    );
  }
}
