import 'package:flutter/material.dart';
import 'package:shopmart_users/widgets/text.dart';

class SumOrderScreen extends StatefulWidget {
  const SumOrderScreen({super.key});

  @override
  State<SumOrderScreen> createState() => _SumOrderScreenState();
}

class _SumOrderScreenState extends State<SumOrderScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          message: "ตะกร้าของฉัน",
        ),
      ),
      body: Placeholder(),
    );
  }
}
