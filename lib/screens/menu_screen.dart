import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmart_users/consts/app_colors.dart';
import 'package:shopmart_users/consts/path_name.dart';
import 'package:shopmart_users/providers/theme_provider.dart';
import 'package:shopmart_users/widgets/buttom_checkout.dart';
import 'package:shopmart_users/widgets/text.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  final List<Map<String, dynamic>> items = [
    {
      "id": 1,
      "name": "กระเพาะหมูไข่ดาว",
      "price": 10.0,
      "status": "SUCCESS",
      "image":
          'https://thejournalistclub.com/wp-content/uploads/2022/06/1-%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%81%E0%B8%B0%E0%B9%80%E0%B8%9E%E0%B8%A3%E0%B8%B2-.jpeg',
      "count": 0
    },
    {
      "id": 2,
      "name": "สเต๊ก",
      "price": 20.0,
      "status": "WATING",
      "image":
          "https://media.istockphoto.com/id/185291480/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B9%80%E0%B8%9A%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B9%80%E0%B8%81%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B8%A2%E0%B9%88%E0%B8%B2%E0%B8%87.jpg?s=1024x1024&w=is&k=20&c=GWnAuFnLyfEsXvZK1swM25tMKGQ7Xw7ZaD74SqA4ndA=",
      "count": 0
    },
    {
      "id": 3,
      "name": "ไข่พะโล้",
      "price": 30.0,
      "status": "WATING",
      "image":
          'https://kin-keng.com/wp-content/uploads/2024/03/%E0%B9%84%E0%B8%82%E0%B9%88%E0%B8%9E%E0%B8%B0%E0%B9%82%E0%B8%A5%E0%B9%89.jpg',
      "count": 0
    },
    {
      "id": 4,
      "name": "ข้าวผัดกระเทียม",
      "price": 40.0,
      "status": "SUCCESS",
      "image":
          'https://media.istockphoto.com/id/945606006/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%9C%E0%B8%B1%E0%B8%94%E0%B9%84%E0%B8%81%E0%B9%88.jpg?s=1024x1024&w=is&k=20&c=T_iAxsko3F-9uqoiuCss0SXb31H05-ViRav_Ax-fQVI=',
      "count": 0
    },
    {
      "id": 5,
      "name": "ข้าวต้ม",
      "price": 40.0,
      "image": '',
      "status": "",
      "count": 0
    },
  ];

  void _updateCount(int id, int delta) {
    setState(() {
      final index = items.indexWhere((item) => item['id'] == id);
      if (index != -1) {
        items[index]['count'] += delta;
        if (items[index]['count'] < 0) items[index]['count'] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          message: "เมนูทั้งหมด",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => _cardFood(
            context: context,
            item: items[index],
            onAdd: () => _updateCount(items[index]['id'], 1),
            onRemove: () => _updateCount(items[index]['id'], -1),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {
          Navigator.pushNamed(context, PathName.createMenuScreen);
        },
        child: const Icon(Icons.add, size: 28),
      ),
      bottomSheet: const BottomCheckout(),
    );
  }
}

Widget _cardFood({
  required BuildContext context,
  required Map<String, dynamic> item,
  required VoidCallback onAdd,
  required VoidCallback onRemove,
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
                  _statusBadge(item["status"]),
                  _actionButtons(context, item['count'], onAdd, onRemove),
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

Widget _statusBadge(String? status) {
  final Map<String, Color> statusColors = {
    "SUCCESS": const Color(0xFFECFFDC),
    "WATING": const Color(0xFFFBCEB1),
    "": const Color(0xFFffbaba),
  };

  final Map<String, Color> textColors = {
    "SUCCESS": const Color.fromARGB(245, 52, 100, 4),
    "WATING": const Color(0xFFFF5F15),
    "": const Color(0xFFff0000),
  };

  final String statusText = {
        "SUCCESS": "ทำรายการเสร็จสิ้น",
        "WATING": "กำลังดำเนินการ",
        "": "ติดต่อเจ้าหน้าที่",
      }[status] ??
      "Unknown";

  return Container(
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      color: statusColors[status],
    ),
    child: Text(
      statusText,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: textColors[status],
      ),
    ),
  );
}

Widget _actionButtons(
    BuildContext context, count, VoidCallback onAdd, VoidCallback onRemove) {
  final themeProvider = Provider.of<ThemeProvider>(context);

  return Align(
    alignment: Alignment.bottomRight,
    child: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: themeProvider.getIsDarkTheme
            ? Colors.black
            : const Color(0xFFeeeeee),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _actionButton(context, Icons.remove, onRemove),
          const SizedBox(width: 10),
          TextWidget(message: count.toString()),
          const SizedBox(width: 10),
          _actionButton(context, Icons.add, onAdd),
        ],
      ),
    ),
  );
}

Widget _actionButton(
    BuildContext context, IconData icon, VoidCallback onPressed) {
  return SizedBox(
    width: 40,
    height: 40,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(5),
        backgroundColor: Theme.of(context).cardTheme.color,
        elevation: 0,
      ),
      child: Icon(
        icon,
        size: 18,
      ),
    ),
  );
}
