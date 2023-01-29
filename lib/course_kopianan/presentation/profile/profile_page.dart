// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_import, implementation_imports, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 227),
      body: SafeArea(
          child: Container(
        child: Container(
          height: 250,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset.fromDirection(50),
                )
              ]),
          child: Column(children: [
            Container(
              height: 160,
              child: Row(children: [
                Container(
                  height: double.infinity,
                  width: 150,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/food.jpg')),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Flexible(
                    child: Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Nasi Lemak Dengan Saus Teri",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Makanan Favorite",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          color: Colors.amber,
                        ))
                      ]),
                ))
              ]),
            ),
            Flexible(
                child: Container(
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        flex: 50, // dalam satuan %
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ))),
                          child: Text(
                            "back",
                            style: TextStyle(fontSize: 16),
                          ),
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        flex: 50, // dalam satuan %
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                          child: Text(
                            "View",
                            style: TextStyle(fontSize: 16),
                          ),
                        ))
                  ]),
            ))
          ]),
        ),
      )),
    );
  }
}
