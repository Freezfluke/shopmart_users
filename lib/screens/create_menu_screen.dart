import 'package:flutter/material.dart';
import 'package:shopmart_users/widgets/text.dart';
import 'package:shopmart_users/widgets/upload_image.dart';

class CreateMenuScreen extends StatelessWidget {
  const CreateMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(message: "สร้างเมนู"),
      ),
      body: const Center(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: UploadImageWidget(),
      )),
    );
  }
}
