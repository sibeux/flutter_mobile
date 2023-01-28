// ignore_for_file: unused_import, implementation_imports, unnecessary_import, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({
    super.key,
    required this.gambar,
  });

  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            // height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              gambar,
              // fit cover itu nanti gambarnya bakalan memenuhi container (layar)
              // fit: BoxFit.cover,
            )),
      ),
    );
  }
}
