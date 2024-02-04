import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  GlutenFree,
  LactoseFree,
  Vegetarian,
  Vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>>{
  FiltersNotifier() : super({
    Filter.GlutenFree: false,
    Filter.LactoseFree: false,
    Filter.Vegetarian: false,
    Filter.Vegan: false,
  });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);
