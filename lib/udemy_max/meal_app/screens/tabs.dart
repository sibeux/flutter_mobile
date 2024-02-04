import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/meal_app/providers/favorites_provider.dart';
import 'package:flutter_mobile/udemy_max/meal_app/providers/meals_provider.dart';
import 'package:flutter_mobile/udemy_max/meal_app/screens/categories.dart';
import 'package:flutter_mobile/udemy_max/meal_app/screens/filters.dart';
import 'package:flutter_mobile/udemy_max/meal_app/screens/meals.dart';
import 'package:flutter_mobile/udemy_max/meal_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilters = {
  Filter.GlutenFree: false,
  Filter.LactoseFree: false,
  Filter.Vegetarian: false,
  Filter.Vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (context) {
          return FiltersScreen(
            currentFilters: _selectedFilters,
          );
        }),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    final availableMeals = meals.where(
      (meal) {
        if (_selectedFilters[Filter.GlutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (_selectedFilters[Filter.LactoseFree]! && !meal.isLactoseFree) {
          return false;
        }
        if (_selectedFilters[Filter.Vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if (_selectedFilters[Filter.Vegan]! && !meal.isVegetarian) {
          return false;
        }
        return true;
      },
    ).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
