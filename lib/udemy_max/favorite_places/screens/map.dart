import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/model/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {super.key,
      this.location = const PlaceLocation(
          latitude: 37.422, longitude: -122.084, address: 'Googleplex'),
      this.isSelecting = true});

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.isSelecting ? 'Pick Location' : 'View Location'),
          actions: [
            if (widget.isSelecting)
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  Navigator.of(context).pop(widget.location);
                },
              ),
          ],
        ),
        body: GoogleMap(
            initialCameraPosition: CameraPosition(
              target:
                  LatLng(widget.location.latitude, widget.location.longitude),
              zoom: 16,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('m1'),
                position:
                    LatLng(widget.location.latitude, widget.location.longitude),
              ),
            }));
  }
}
