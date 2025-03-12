import 'package:flutter/material.dart';
import 'package:shopmart_users/widgets/text.dart';

class SwitchTitle extends StatelessWidget {
  const SwitchTitle(
      {super.key,
      required this.onPress,
      required this.text,
      required this.value});
  final Function onPress;
  final String text;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: TextWidget.subtitle(message: text),
        value: value,
        onChanged: (value) {
          onPress(value);
        });
  }
}
