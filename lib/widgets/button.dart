import 'package:flutter/material.dart';
import 'package:shopmart_users/widgets/text.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
      style: ElevatedButton.styleFrom(
          elevation: 12.0, textStyle: const TextStyle(color: Colors.white)),
      child: const TextWidget(
        message: "บันทึก",
      ),
    );
  }
}
