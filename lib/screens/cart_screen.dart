import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmart_users/consts/app_colors.dart';
import 'package:shopmart_users/consts/path_name.dart';
import 'package:shopmart_users/providers/menu_provider.dart';
import 'package:shopmart_users/providers/theme_provider.dart';
import 'package:shopmart_users/providers/thme_data.dart';
import 'package:shopmart_users/widgets/text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
        backgroundColor: themeProvider.getIsDarkTheme
            ? Theme.of(context).scaffoldBackgroundColor
            : const Color(0xFFeeeeee),
        appBar: AppBar(
          title: const TextWidget(message: "ตะกร้าของฉัน"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: menuProvider.items.length,
                itemBuilder: (context, index) => _cardFood(
                  context: context,
                  item: menuProvider.items[index],
                ),
              ),
            ),
            _footerSummary(menuProvider, themeProvider, context)
          ],
        ));
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          elevation: 0,
          margin: const EdgeInsets.only(top: 6, left: 5, right: 5),
          child: Padding(
            padding: const EdgeInsets.all(5),
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
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextWidget(
                          message: "ราคา : ${item['price']} บาท",
                          style: const TextStyle(
                            fontSize: 14,
                          )),
                      TextWidget(
                        message: "จำนวน : ${item['count']} ",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _foodImage(String? imageUrl) {
    const placeholder =
        'https://as1.ftcdn.net/jpg/05/03/24/40/1000_F_503244059_fRjgerSXBfOYZqTpei4oqyEpQrhbpOML.jpg';
    return Container(
      width: 80,
      height: 70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Image.network(
              imageUrl?.isNotEmpty == true ? imageUrl! : placeholder,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Image.network(placeholder, fit: BoxFit.cover),
            ),
          )),
    );
  }

  Widget _footerSummary(MenuProvider menuProvider, ThemeProvider themeProvider,
      BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themeProvider.getIsDarkTheme
            ? Theme.of(context).cardTheme.color
            : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const TextWidget(
              message: 'ราคา',
            ),
            TextWidget(
              message: '${menuProvider.totalPrice.toString()} บาท',
            )
          ]),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  message: 'ส่วนลด',
                ),
                TextWidget(
                  message: '0 บาท',
                )
              ]),
          const Divider(
            height: 30,
            thickness: 0.5,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const TextWidget(
              style: TextStyle(fontWeight: FontWeight.bold),
              message: 'ราคาสุทธิ',
            ),
            TextWidget(
              style: const TextStyle(fontWeight: FontWeight.bold),
              message: '${menuProvider.totalPrice.toString()} บาท',
            )
          ])
        ],
      ),
    );
  }
}
