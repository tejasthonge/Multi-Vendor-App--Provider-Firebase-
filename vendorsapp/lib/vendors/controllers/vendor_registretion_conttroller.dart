import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VendorResigistrationController {
  pickStorImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _xFile = await _imagePicker.pickImage(source: source);
    if (_xFile != null) {
      return await _xFile.readAsBytes();
    } else {
      return "No Image Selected";
    }
   }
}
