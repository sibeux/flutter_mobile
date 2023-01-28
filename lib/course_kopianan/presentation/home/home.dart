// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobile/course_kopianan/presentation/dashboard/dashboard.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              String title = "Ini berasal dari home page";
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Dashboard(
                        title: title,
                      )));
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(71, 85, 38, 238)),
            ),
            child: Text("Go To Dashboard"),
          ),
          ElevatedButton(
            onPressed: () {
              String title = "Ini berasal dari home page";
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Dashboard(
                        title: title,
                      )));
            },
            child: Text("ke Dashboard (ga bisa back)"),
          ),
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        ],
      ),
    );
  }
}
