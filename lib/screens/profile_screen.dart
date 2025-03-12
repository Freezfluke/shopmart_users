import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopmart_users/providers/theme_provider.dart';
import 'package:shopmart_users/widgets/text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(message: "ฉัน"),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Visibility(
                visible: false,
                child: TextWidget.subtitle(
                  message: "กรุณาเข้าสู่ระบบก่อนใช้งาน",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.surface,
                            width: 1),
                        image: const DecorationImage(
                            image: NetworkImage(
                          "https://banner2.cleanpng.com/20180725/hrj/kisspng-computer-icons-person-5b58a2a82e0cd6.9562737315325354641886.jpg",
                        ))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextWidget.subtitle(
                        message: "นายญาณพล ฉัตรแก้วมณีวงศ์",
                      ),
                      TextWidget(
                        message: "Yanaphon@gmail.com",
                      )
                    ],
                  )),
                ],
              ),
              _menuProfile(context)
            ],
          )),
    );
  }
}

Widget _menuProfile(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const TextWidget.title(
            message: "ทั่วไป",
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Icon(
              IconlyBold.paper,
              color: Colors.orangeAccent,
              size: 40.0,
            ),
            title: TextWidget.subtitle(message: "เมนูทั้งหมด"),
            trailing: Icon(IconlyBold.arrowRight2),
          ),
          const Divider(
            height: 20,
            thickness: 0.5,
            indent: 20,
            endIndent: 0,
            color: Colors.grey,
          ),
          const TextWidget.title(
            message: "ตั้งค่า",
          ),
          SwitchListTile(
              secondary: const Icon(
                IconlyBold.star,
                size: 40,
                color: Colors.pinkAccent,
              ),
              onChanged: (value) =>
                  themeProvider.setDarkTheme(themeValue: value),
              title: TextWidget.subtitle(
                  message: themeProvider.getIsDarkTheme
                      ? "Dark Mode"
                      : "Light Mode"),
              value: themeProvider.getIsDarkTheme),
          const Divider(
            height: 20,
            thickness: 0.5,
            indent: 20,
            endIndent: 0,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                child: const TextWidget.subtitle(message: "ออกจากระบบ")),
          )
        ],
      ));
}
