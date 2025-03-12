import 'package:flutter/material.dart';
import 'package:shopmart_users/widgets/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextWidget(
            message: "Hello",
          ),
          const TextWidget.subtitle(),
          const TextWidget.title(),
          const TextWidget.headTitle(),
          ElevatedButton(onPressed: () {}, child: const Text("Click Me!")),
        ],
      ),
    ));
  }
}
