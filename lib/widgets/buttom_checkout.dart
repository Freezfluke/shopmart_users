import 'package:flutter/material.dart';
import 'package:shopmart_users/widgets/button.dart';
import 'package:shopmart_users/widgets/text.dart';

class BottomCheckout extends StatefulWidget {
  const BottomCheckout({super.key});

  @override
  State<BottomCheckout> createState() => _BottomCheckoutState();
}

void submit() {}

class _BottomCheckoutState extends State<BottomCheckout> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
        ));
  }
}
