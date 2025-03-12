import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopmart_users/providers/theme_provider.dart';
import 'package:shopmart_users/widgets/button.dart';
import 'package:shopmart_users/widgets/text.dart';

class UploadImageWidget extends StatefulWidget {
  const UploadImageWidget({super.key});
  @override
  UploadImageWidgetState createState() => UploadImageWidgetState();
}

class UploadImageWidgetState extends State<UploadImageWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController count = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Pick from Gallery'),
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(ctx);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _showPicker(context),
          child: _image != null
              ? Image.file(_image!, width: 150, height: 150, fit: BoxFit.cover)
              : const Card(
                  child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.camera_alt,
                        size: 50,
                      ),
                      TextWidget(
                        message: "อัปโหลดรูปภาพ",
                      )
                    ],
                  ),
                )),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: name,
          decoration: const InputDecoration(labelText: "ชื่อเมนู"),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: price,
          decoration: const InputDecoration(labelText: "ราคา"),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: price,
          decoration: const InputDecoration(labelText: "จำนวน"),
        ),
        const SizedBox(height: 40),
        SizedBox(width: 300, height: 50, child: Button()),
      ],
    );
  }
}
