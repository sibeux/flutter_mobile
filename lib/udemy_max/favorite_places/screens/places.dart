import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/providers/user_places.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/screens/add_place.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/widgets/places_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to add place screen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddPlaceScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: PlaceList(
        places: userPlaces,
      ),
    );
  }
}
