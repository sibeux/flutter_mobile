import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/meal_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Image.network(
        meal.imageUrl,
        fit: BoxFit.cover,
        height: 300,
        width: double.infinity,
      ),
    );
  }
}
