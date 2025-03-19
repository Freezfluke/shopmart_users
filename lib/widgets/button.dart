import 'package:flutter/material.dart';
import 'package:shopmart_users/widgets/text.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.onPress, this.name = 'บันทึก'});
  final Function onPress;
  final String name;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPress();
      },
      child: TextWidget(
        message: name,
      ),
    );
  }
}
