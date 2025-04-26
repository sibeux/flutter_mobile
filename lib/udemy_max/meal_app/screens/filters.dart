import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/meal_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_mobile/udemy_max/meal_app/screens/tabs.dart';
// import 'package:flutter_mobile/udemy_max/meal_app/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

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
      body: Column(
        children: [
          listFilters(
            context,
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
            value: activeFilters[Filter.glutenFree]!,
            widgetRef: ref,
            filter: Filter.glutenFree,
          ),
          listFilters(
            context,
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
            value: activeFilters[Filter.lactoseFree]!,
            widgetRef: ref,
            filter: Filter.lactoseFree,
          ),
          listFilters(
            context,
            title: 'Vegetarian-free',
            subtitle: 'Only include vegetarian-free meals.',
            value: activeFilters[Filter.vegetarian]!,
            widgetRef: ref,
            filter: Filter.vegetarian,
          ),
          listFilters(
            context,
            title: 'Vegan-free',
            subtitle: 'Only include vegan-free meals.',
            value: activeFilters[Filter.vegan]!,
            widgetRef: ref,
            filter: Filter.vegan,
          ),
        ],
      ),
    );
  }

  SwitchListTile listFilters(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool value,
    required WidgetRef widgetRef,
    required Filter filter,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: (isChecked) {
        widgetRef.read(filtersProvider.notifier).setFilter(
              filter,
              isChecked,
            );
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
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
