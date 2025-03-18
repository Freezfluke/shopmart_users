import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmart_users/consts/path_name.dart';
import 'package:shopmart_users/providers/menu_provider.dart';
import 'package:shopmart_users/widgets/text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(message: "ตะกร้าของฉัน"),
      ),
      body: ListView.builder(
        itemCount: menuProvider.items.length,
        itemBuilder: (context, index) => _cardFood(
          context: context,
          item: menuProvider.items[index],
        ),
      ),
    );
  }

  Widget _cardFood({
    required BuildContext context,
    required Map<String, dynamic> item,
  }) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, PathName.detailMenuScreen, arguments: item)
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _foodImage(item["image"]),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      message: item['name'],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    TextWidget(
                      message: "ราคา : ${item['price']} บาท",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    TextWidget(
                      message: "จำนวน : ${item['count']} ",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _foodImage(String? imageUrl) {
    const placeholder =
        'https://as1.ftcdn.net/jpg/05/03/24/40/1000_F_503244059_fRjgerSXBfOYZqTpei4oqyEpQrhbpOML.jpg';
    return Container(
      width: 110,
      height: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Image.network(
          imageUrl?.isNotEmpty == true ? imageUrl! : placeholder,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) =>
              Image.network(placeholder, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
