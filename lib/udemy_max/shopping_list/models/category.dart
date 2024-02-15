import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  fruit,
  meat,
  bread,
  dairy,
  eggs,
  sweets,
  snacks,
  carbs,
  spices,
  convenience,
  hygiene,
  other,
}

class Category {
  const Category(this.title, this.color);

  final String title;
  final Color color;

}
