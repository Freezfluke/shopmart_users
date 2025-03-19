import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopmart_users/screens/cart_screen.dart';
import 'package:shopmart_users/screens/history_order_screen.dart';
import 'package:shopmart_users/screens/home_screen.dart';
import 'package:shopmart_users/screens/profile_screen.dart';
import 'package:shopmart_users/screens/menu_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screen;
  int currentScreen = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    screen = const [
      HomeScreen(),
      HistoryOrderScreen(),
      MenuScreen(),
      ProfileScreen(),
    ];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: screen,
        ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 0.5, blurRadius: 2),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              child: NavigationBar(
                selectedIndex: currentScreen,
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(IconlyBold.home),
                    label: "หน้าแรก",
                  ),
                  NavigationDestination(
                      icon: Icon(IconlyBold.send), label: "ประวัติ"),
                  NavigationDestination(
                      icon: Icon(IconlyBold.paper), label: "เมนูทั้งหมด"),
                  NavigationDestination(
                      icon: Icon(IconlyBold.profile), label: "โปรไฟล์"),
                ],
                onDestinationSelected: (index) => {
                  setState(() {
                    currentScreen = index;
                  }),
                  controller.jumpToPage(currentScreen)
                },
              ),
            ))
        // )
        );
  }
}
