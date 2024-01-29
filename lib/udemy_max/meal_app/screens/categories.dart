import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/meal_app/data/dummy_data.dart';
import 'package:flutter_mobile/udemy_max/meal_app/screens/meals.dart';
import 'package:flutter_mobile/udemy_max/meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  void _selectCategory(BuildContext context, String id, String title) {
    // pushNamed() is used to navigate to a named route
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MealsScreen(
          title: 'Some title',
          meals: [],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category!'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category.id, category.title);
              },
            ),
        ],
      ),
    );
  }
}
