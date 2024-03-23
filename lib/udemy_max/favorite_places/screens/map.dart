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
  LatLng? _pickedPosition;

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
                Navigator.of(context).pop(_pickedPosition);
              },
            ),
        ],
      ),
      body: GoogleMap(
        onTap: !widget.isSelecting
            ? null
            : (position) {
                setState(() {
                  _pickedPosition = position;
                });
              },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.latitude, widget.location.longitude),
          zoom: 16,
        ),
        markers: (_pickedPosition == null && widget.isSelecting)
            ? {}
            : <Marker>{
                Marker(
                  markerId: const MarkerId('m1'),
                  position: _pickedPosition ??
                      LatLng(
                          widget.location.latitude, widget.location.longitude),
                ),
              },
      ),
    );
  }
}
