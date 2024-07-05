import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadScreenApp extends StatelessWidget {
  const UploadScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Upload to Server Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              XFile? image = await pickImageFromCamera();
              debugPrint(image?.path);
              await uploadImageToServer(image);
            },
            child: const Text('Pick and Upload Image to Server'),
          ),
        ),
      ),
    );
  }
}

Future<XFile?> pickImageFromCamera() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.camera);
  return image;
}

Future<void> uploadImageToServer(XFile? image) async {
  if (image != null) {
    String uploadUrl = 'https://sibeux.my.id/sihalal/upload.php';
    var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
    request.files.add(await http.MultipartFile.fromPath('file', image.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      debugPrint('File uploaded successfully.');
    } else {
      debugPrint('Failed to upload file.');
    }
  } else {
    debugPrint('No image selected.');
  }
}