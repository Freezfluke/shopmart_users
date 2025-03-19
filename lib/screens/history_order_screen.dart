import 'package:flutter/material.dart';
import 'package:shopmart_users/widgets/text.dart';

class HistoryOrderScreen extends StatefulWidget {
  const HistoryOrderScreen({super.key});

  @override
  State<HistoryOrderScreen> createState() => _HistoryOrderScreenState();
}

class _HistoryOrderScreenState extends State<HistoryOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextWidget(message: "ประวัติการสั่งซื้อ")),
    );
  }
}
