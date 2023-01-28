// ignore_for_file: unused_import, implementation_imports, unnecessary_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  List<String> foodGambar = [
    "assets/images/food.jpg",
    "assets/images/food2.jpg",
    "assets/images/food3.jpg",
    "assets/images/food4.jpg",
    "assets/images/food5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return ItemCountLV(
      foodGambar: foodGambar,
    );
  }
}

class ItemCountLV extends StatelessWidget {
  final List foodGambar;

  const ItemCountLV({
    Key? key,
    required this.foodGambar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: ListView.builder(
            itemCount: foodGambar.length,
            itemBuilder: (context, index) => Container(
                  height: 200,
                  margin: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    foodGambar[index],
                    // fit: BoxFit.cover,
                  ),
                )),
      )),
    );
  }
}
