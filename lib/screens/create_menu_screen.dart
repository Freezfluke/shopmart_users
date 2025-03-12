import 'package:flutter/material.dart';
import 'package:shopmart_users/consts/validator.dart';
import 'package:shopmart_users/widgets/button.dart';
import 'package:shopmart_users/widgets/text.dart';
import 'package:shopmart_users/widgets/upload_image.dart';

class CreateMenuScreen extends StatefulWidget {
  const CreateMenuScreen({super.key});

  @override
  State<CreateMenuScreen> createState() => _CreateMenuScreenState();
}

class _CreateMenuScreenState extends State<CreateMenuScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController count = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    price.dispose();
    count.dispose();
    super.dispose();
  }

  void onSubmitCreate() {
    if (_formKey.currentState!.validate()) {
      print("Valid!");
      Navigator.of(context).pop();
    }
  }

  Widget _renderForm() {
    return Column(
      children: <Widget>[
        const UploadImageWidget(),
        const SizedBox(height: 20),
        TextFormField(
          controller: name,
          decoration: const InputDecoration(labelText: "ชื่อเมนู"),
          validator: Validators.required(),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: price,
          decoration: const InputDecoration(labelText: "ราคา"),
          validator: Validators.requiredNumber(),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: count,
          decoration: const InputDecoration(labelText: "จำนวน"),
          validator: Validators.requiredNumber(),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: 350,
          height: 50,
          child: Button(
            onPress: onSubmitCreate,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: AppBar(
              title: const TextWidget(message: "สร้างเมนู"),
            ),
            body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: _renderForm(),
                  ),
                ),
              ),
            )));
  }
}
