import 'package:flutter/material.dart';
import 'package:shopmart_users/widgets/text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: TextWidget.headTitle(message: "Cart Screen"),
    ));
  }
}
