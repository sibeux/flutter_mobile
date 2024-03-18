import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/widgets/places_list.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to add place screen
            },
          ),
        ],
      ),
      body: PlaceList(places: []),
    );
  }
}