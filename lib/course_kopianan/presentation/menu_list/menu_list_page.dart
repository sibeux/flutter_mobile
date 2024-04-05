// ignore_for_file: unused_import, implementation_imports, unnecessary_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobile/course_kopianan/presentation/item_detail/item_detail_page.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListState();
}

class _MenuListState extends State<MenuListPage> {
  List<String> foodGambar = [
    "assets/images/food.jpg",
    "assets/images/food2.jpg",
    "assets/images/food3.jpg",
    "assets/images/food4.jpg",
    "assets/images/food5.jpg",
    "assets/images/food.jpg",
    "assets/images/food2.jpg",
    "assets/images/food3.jpg",
    "assets/images/food4.jpg",
    "assets/images/food5.jpg",
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
    super.key,
    required this.foodGambar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              child:
                  // BasicListView(foodGambar: foodGambar),
                  GridView.builder(
                      itemCount: foodGambar.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ItemDetailPage(
                                      gambar: foodGambar[index],
                                    )));
                          },
                          child:
                              ListImageItem(foodGambar: foodGambar[index]))))),
    );
  }
}

class ListImageItem extends StatelessWidget {
  const ListImageItem({
    super.key,
    required this.foodGambar,
  });

  final String foodGambar;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Image.asset(
        foodGambar,
        fit: BoxFit.cover,
      ),
    );
  }
}

class BasicListView extends StatelessWidget {
  const BasicListView({
    super.key,
    required this.foodGambar,
  });

  final List foodGambar;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: foodGambar.length,
        itemBuilder: (context, index) => Container(
              height: 200,
              margin: EdgeInsets.only(top: 10),
              child: Image.asset(
                foodGambar[index],
                // fit: BoxFit.cover,
              ),
            ));
  }
}
