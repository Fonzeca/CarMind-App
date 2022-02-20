import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileContent extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  bool isVideo = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
        },
        child: Text("Sacar Foto"),
      ),
    );
  }

}
