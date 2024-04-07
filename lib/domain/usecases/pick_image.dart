import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class PickImage {
  Future<Uint8List?> camera() async {
    return await (await ImagePicker().pickImage(
      source: ImageSource.camera,
    ))?.readAsBytes();
  }
}
