import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmart_users/consts/app_colors.dart';
import 'package:shopmart_users/providers/theme_provider.dart';
import 'package:shopmart_users/widgets/text.dart';

class HistoryOrderScreen extends StatefulWidget {
  const HistoryOrderScreen({super.key});

  @override
  State<HistoryOrderScreen> createState() => _HistoryOrderScreenState();
}

class _HistoryOrderScreenState extends State<HistoryOrderScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  final List<Map<String, dynamic>> items = [
    {
      "id": 1,
      "orderId": '123123123',
      "name": "Yanaphon Food",
      "time": "7 ก.ค 2567",
      "status": 'จัดส่งสำเร็จ',
      "itemsCount": "22",
      "items": [
        {
          "imageUrl":
              "https://thejournalistclub.com/wp-content/uploads/2022/06/1-%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%81%E0%B8%B0%E0%B9%80%E0%B8%9E%E0%B8%A3%E0%B8%B2-.jpeg",
          "name": 'อาหารตามสั่ง',
          "price": "40.0",
          "count": "20",
          "totalPrice": "40"
        },
        {
          "id": 3,
          "name": "ไข่พะโล้",
          "price": 30.0,
          "status": "WATING",
          "imageUrl":
              'https://kin-keng.com/wp-content/uploads/2024/03/%E0%B9%84%E0%B8%82%E0%B9%88%E0%B8%9E%E0%B8%B0%E0%B9%82%E0%B8%A5%E0%B9%89.jpg',
          "count": 0
        },
        {
          "id": 4,
          "name": "ข้าวผัดกระเทียม",
          "price": 40.0,
          "status": "SUCCESS",
          "imageUrl":
              'https://media.istockphoto.com/id/945606006/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%9C%E0%B8%B1%E0%B8%94%E0%B9%84%E0%B8%81%E0%B9%88.jpg?s=1024x1024&w=is&k=20&c=T_iAxsko3F-9uqoiuCss0SXb31H05-ViRav_Ax-fQVI=',
          "count": 0
        },
      ],
      "totalPrice": "200"
    },
    {
      "id": 1,
      "orderId": '123123123',
      "name": "Yanaphon Food",
      "time": "7 ก.ค 2567",
      "status": 'จัดส่งสำเร็จ',
      "itemsCount": "22",
      "items": [
        {
          "imageUrl":
              "https://thejournalistclub.com/wp-content/uploads/2022/06/1-%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%81%E0%B8%B0%E0%B9%80%E0%B8%9E%E0%B8%A3%E0%B8%B2-.jpeg",
          "name": 'อาหารตามสั่ง',
          "price": "40.0",
          "count": "20",
          "totalPrice": "40"
        },
        {
          "id": 3,
          "name": "ไข่พะโล้",
          "price": 30.0,
          "status": "WATING",
          "imageUrl":
              'https://kin-keng.com/wp-content/uploads/2024/03/%E0%B9%84%E0%B8%82%E0%B9%88%E0%B8%9E%E0%B8%B0%E0%B9%82%E0%B8%A5%E0%B9%89.jpg',
          "count": 0
        },
        {
          "id": 4,
          "name": "ข้าวผัดกระเทียม",
          "price": 40.0,
          "status": "SUCCESS",
          "imageUrl":
              'https://media.istockphoto.com/id/945606006/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%9C%E0%B8%B1%E0%B8%94%E0%B9%84%E0%B8%81%E0%B9%88.jpg?s=1024x1024&w=is&k=20&c=T_iAxsko3F-9uqoiuCss0SXb31H05-ViRav_Ax-fQVI=',
          "count": 0
        },
      ],
      "totalPrice": "200"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.getIsDarkTheme
          ? Theme.of(context).scaffoldBackgroundColor
          : const Color(0xFFeeeeee),
      appBar: AppBar(
        title: const TextWidget(message: "ประวัติการสั่งอาหาร"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => _cardOrder(item: items[index])),
    );
  }

  Widget _cardOrder({required Map<String, dynamic> item}) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    message: item["orderId"],
                  ),
                  TextWidget(
                    message: item["time"],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextWidget(
                message: item["name"],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                          height: 130,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: item["items"].length,
                              itemBuilder: (context, index) => _imageCard(
                                  itemDetail: item['items'][index])))),
                  const Expanded(
                    child: TextWidget(message: "Hello"),
                  )
                ],
              ),
              const Divider(
                height: 10,
                thickness: 0.5,
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
              TextWidget(
                message: item["status"],
                style: const TextStyle(
                    color: AppColors.lightPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }

  Widget _imageCard({required Map<String, dynamic> itemDetail}) {
    const placeholder =
        'https://as1.ftcdn.net/jpg/05/03/24/40/1000_F_503244059_fRjgerSXBfOYZqTpei4oqyEpQrhbpOML.jpg';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 6,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                    width: 120,
                    itemDetail["imageUrl"]?.isNotEmpty == true
                        ? itemDetail["imageUrl"]!
                        : placeholder,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Image.network(
                      placeholder,
                      fit: BoxFit.contain,
                      width: 120,
                    ),
                  ),
                ))),
        Expanded(
            child: TextWidget(
          message: itemDetail["name"],
        ))
      ],
    );
  }
}
