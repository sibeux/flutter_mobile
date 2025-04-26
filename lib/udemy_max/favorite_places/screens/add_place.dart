import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/model/place.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/providers/user_places.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/widgets/image_input.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/widgets/location_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _selectedImage == null ||
        _selectedLocation == null) {
      return;
    }

    ref
        .read(userPlacesProvider.notifier)
        .addPlace(_titleController.text, _selectedImage!, _selectedLocation!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 10,
            ),
            ImageInput(
              onSelectImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            LocationInput(
              onSelectLocation: (location) {
                _selectedLocation = location;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('add place'),
            )
          ],
        ),
      ),
    );
  }
}
