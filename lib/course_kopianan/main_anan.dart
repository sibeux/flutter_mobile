// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_mobile/course_kopianan/presentation/menu_list/menu_list_page.dart';
import 'package:flutter_mobile/course_kopianan/presentation/profile/profile_page.dart';

import 'presentation/home/home.dart';

void main(List<String> args) {
  runApp(MyAppAnan());
}

class MyAppAnan extends StatelessWidget {
  const MyAppAnan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: Home(),
      home: ProfilePage(),
    );
  }
}

// body: Container(
      //   width: double.infinity, // rata tengah mendatar
      //   // height: double.infinity, # rata tengah menurun
      //   margin: EdgeInsets.all(10),
      //   padding: EdgeInsets.all(20),
      //   color: Color.fromARGB(255, 159, 171, 240),
      //   child: Icon(
      //     Icons.headphones,
      //     color: Colors.red,
      //     size: 100,
      //   ),
      // ),

      // body: Container(
      //   height: 500,
      //   color: Colors.green,
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       Text(
      //         "Ini adalah",
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         "Ini",
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         "Ini adalah hari minggu",
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       Text(
      //         "Ini adalah hari minggu",
      //         style: TextStyle(fontSize: 30),
      //       ),
      //     ],
      //   ),
      // ),