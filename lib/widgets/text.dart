import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String message;
  final TextStyle? style;

  @immutable
  const TextWidget({super.key, this.message = "Not text", this.style});

  const TextWidget.title({super.key, this.message = "Not text"})
      : style = const TextStyle(fontSize: 24, fontWeight: FontWeight.normal);

  const TextWidget.subtitle({
    super.key,
    this.message = "Not text",
  }) : style = const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
        );

  const TextWidget.headTitle({super.key, this.message = "Not text"})
      : style = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: style,
      // softWrap: true,
    );
  }
}
