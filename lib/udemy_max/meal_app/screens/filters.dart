import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/meal_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_mobile/udemy_max/meal_app/screens/tabs.dart';
// import 'package:flutter_mobile/udemy_max/meal_app/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    Key? key,
  }) : super(key: key);

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
            value: activeFilters[Filter.GlutenFree]!,
            widgetRef: ref,
            filter: Filter.GlutenFree,
          ),
          listFilters(
            context,
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
            value: activeFilters[Filter.LactoseFree]!,
            widgetRef: ref,
            filter: Filter.LactoseFree,
          ),
          listFilters(
            context,
            title: 'Vegetarian-free',
            subtitle: 'Only include vegetarian-free meals.',
            value: activeFilters[Filter.Vegetarian]!,
            widgetRef: ref,
            filter: Filter.Vegetarian,
          ),
          listFilters(
            context,
            title: 'Vegan-free',
            subtitle: 'Only include vegan-free meals.',
            value: activeFilters[Filter.Vegan]!,
            widgetRef: ref,
            filter: Filter.Vegan,
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
