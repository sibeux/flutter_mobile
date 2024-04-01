import 'package:flutter/material.dart';

class MusicDetailScreen extends StatefulWidget {
  const MusicDetailScreen({super.key});

  @override
  State<MusicDetailScreen> createState() => _MusicDetailScreenState();
}

class _MusicDetailScreenState extends State<MusicDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Music'),
      ),
    );
  }
}