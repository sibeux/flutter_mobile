import 'package:flutter_mobile/udemy_max/favorite_places/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace, ...state]; // Add new place to the beginning of the list
    // state = [...state, newPlace]; // Add new place to the end of the list
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
