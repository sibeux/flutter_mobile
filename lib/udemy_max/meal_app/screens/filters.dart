import 'package:flutter/material.dart';
// import 'package:flutter_mobile/udemy_max/meal_app/screens/tabs.dart';
// import 'package:flutter_mobile/udemy_max/meal_app/widgets/main_drawer.dart';

enum Filter {
  GlutenFree,
  LactoseFree,
  Vegetarian,
  Vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    Key? key, required this.currentFilters,
  }) : super(key: key);

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.GlutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.LactoseFree]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.Vegetarian]!;
    _veganFreeFilterSet = widget.currentFilters[Filter.Vegan]!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (context) {
      //           return const TabsScreen();
      //         }),
      //       );
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.GlutenFree: _glutenFreeFilterSet,
            Filter.LactoseFree: _lactoseFreeFilterSet,
            Filter.Vegetarian: _vegetarianFreeFilterSet,
            Filter.Vegan: _veganFreeFilterSet,
          });
        },
        child: Column(
          children: [
            listFilters(context,
                title: 'Gluten-free',
                subtitle: 'Only include gluten-free meals.',
                value: _glutenFreeFilterSet),
            listFilters(context,
                title: 'Lactose-free',
                subtitle: 'Only include lactose-free meals.',
                value: _lactoseFreeFilterSet),
            listFilters(context,
                title: 'Vegetarian-free',
                subtitle: 'Only include vegetarian-free meals.',
                value: _vegetarianFreeFilterSet),
            listFilters(context,
                title: 'Vegan-free',
                subtitle: 'Only include vegan-free meals.',
                value: _veganFreeFilterSet),
          ],
        ),
      ),
    );
  }

  SwitchListTile listFilters(BuildContext context,
      {required String title, required String subtitle, required bool value}) {
    return SwitchListTile(
      value: value,
      onChanged: (isChecked) {
        setState(() {
          if (title == 'Gluten-free') {
            _glutenFreeFilterSet = isChecked;
          } else if (title == 'Lactose-free') {
            _lactoseFreeFilterSet = isChecked;
          } else if (title == 'Vegetarian-free') {
            _vegetarianFreeFilterSet = isChecked;
          } else if (title == 'Vegan-free') {
            _veganFreeFilterSet = isChecked;
          }
        });
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}
