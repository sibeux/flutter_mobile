import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: () {
            // handle the press
          },
        ),
        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          'WhatsApp Audio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: HexColor('#1e0b2b'),
            fontSize: 21,
          ),
        ),
        // backgroundColor: HexColor('#fefffe'),
        backgroundColor: const Color.fromARGB(255, 253, 173, 167),
      ),
      body: Container(
        color: HexColor('#fefffe'),
        child: const Center(
          child: Text(
            'Music Screen',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
