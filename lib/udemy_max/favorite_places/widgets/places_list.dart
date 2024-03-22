import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/model/place.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/screens/places_detail.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'Got no places yet, start adding some!',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(
                places[index].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PlaceDetailScreen(place: places[index]);
                    },
                  ),
                );
              },
            ));
  }
}