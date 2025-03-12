import 'package:flutter/material.dart';
import 'package:shopmart_users/widgets/text.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPress,
  });
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPress();
      },
      child: const TextWidget(
        message: "บันทึก",
      ),
    );
  }
}
