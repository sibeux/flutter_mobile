import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/model/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;

  String get locationImage {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=${place.location.latitude},${place.location.longitude}&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C${place.location.latitude},${place.location.longitude}&key=AIzaSyD-j_GLs2j6os2dLQw5KZsLk6vHTwgWojI';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(locationImage),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black54],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Text(
                  place.location.address,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
