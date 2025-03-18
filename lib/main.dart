import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmart_users/consts/path_name.dart';
import 'package:shopmart_users/providers/menu_provider.dart';
import 'package:shopmart_users/providers/theme_provider.dart';
import 'package:shopmart_users/providers/thme_data.dart';
import 'package:shopmart_users/root_screen.dart';
import 'package:shopmart_users/screens/cart_screen.dart';
import 'package:shopmart_users/screens/create_menu_screen.dart';
import 'package:shopmart_users/screens/detail_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => MenuProvider()),
        ],
        child:
            Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),
            home: const RootScreen(),
            routes: <String, WidgetBuilder>{
              PathName.createMenuScreen: (BuildContext context) =>
                  const CreateMenuScreen(),
              PathName.detailMenuScreen: (BuildContext context) =>
                  const DetailMenuScreen(),
              PathName.sumOrderScreen: (BuildContext context) =>
                  const CartScreen()
            },
          );
        }));
  }
}
