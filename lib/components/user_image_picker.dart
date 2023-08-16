import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;

  const UserImagePicker({Key? key, required this.imagePickFn}) : super(key: key);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _imageFile;

  Future<void> _pickImageFromSource(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _imageFile = File(pickedImage.path);
    });

    widget.imagePickFn(_imageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
        ),
        TextButton.icon(
          onPressed: () => _pickImageFromSource(ImageSource.camera),
          icon: Icon(Icons.camera),
          label: Text('Take Photo'),
        ),
        TextButton.icon(
          onPressed: () => _pickImageFromSource(ImageSource.gallery),
          icon: Icon(Icons.image),
          label: Text('Choose from Gallery'),
        ),
      ],
    );
  }
}
