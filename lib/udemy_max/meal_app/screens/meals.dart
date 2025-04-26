import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/meal_app/models/meal.dart';
import 'package:flutter_mobile/udemy_max/meal_app/screens/meal_details.dart';
import 'package:flutter_mobile/udemy_max/meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => MealDetailsScreen(
                meal: meal,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No meals found!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                )),
        const SizedBox(height: 24),
        Text('Try changing your filters!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                )),
      ],
    ));

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: ((context, index) => MealItem(
              meal: meals[index],
              onSelectMeal: selectMeal,
            )),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
