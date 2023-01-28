// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../widgets/icon_with_label.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 147, 195, 244),
        title: Text(
          "Online Course",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const <Widget>[
          Icon(Icons.account_circle_rounded),
        ],
      ),
      body: Center(
        child: Container(
          height: 80,
          width: double.infinity,
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              IconWithLabel(
                icon: Icons.call,
                text: "Call",
                colorIcon: Colors.blue,
                colortext: Colors.blue,
              ),
              IconWithLabel(
                icon: Icons.navigation,
                text: "Route",
                colorIcon: Colors.red,
                colortext: Colors.red,
              ),
              IconWithLabel(
                icon: Icons.share,
                text: "Share",
                colorIcon: Colors.yellow,
                colortext: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}