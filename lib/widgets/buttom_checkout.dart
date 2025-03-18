import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmart_users/consts/app_colors.dart';
import 'package:shopmart_users/consts/path_name.dart';
import 'package:shopmart_users/providers/menu_provider.dart';
import 'package:shopmart_users/providers/theme_provider.dart';
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final menuProvider = Provider.of<MenuProvider>(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: themeProvider.getIsDarkTheme
            ? AppColors.darkLightScaffold
            : Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(66, 41, 32, 32),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      height: 80,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: themeProvider.getIsDarkTheme
                      ? AppColors.darkCard
                      : Colors.grey.shade200,
                ),
                padding: const EdgeInsets.all(15),
                child: TextWidget.subtitle(
                  message: menuProvider.count.toString(),
                ),
              )
            ],
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                message: "รวมทั้งหมด",
              ),
              TextWidget.subtitle(
                message: menuProvider.totalPrice.toString(),
              )
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PathName.sumOrderScreen);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: themeProvider.getIsDarkTheme
                        ? AppColors.darkCard
                        : AppColors.lightPrimary,
                    borderRadius:
                        BorderRadius.circular(12), // Optional: Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 12), // Auto width
                  child: const TextWidget(
                    message: "ดูรายการทั้งหมด",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
