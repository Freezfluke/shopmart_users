import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  int _count = 0;
  double _totalPrice = 0;
  final List<Map<String, dynamic>> _items = [];
  int get count => _count;
  double get totalPrice => _totalPrice;

  List<Map<String, dynamic>> get items => _items;

  void setTotalPrice({required double total}) {
    _totalPrice = total;
    notifyListeners();
  }

  void setCount({required int count}) {
    _count = count;
    notifyListeners();
  }

  void setControlItems({
    required int id,
    required String name,
    required double price,
    required String image,
    required String status,
    required int count,
  }) {
    final newItems = _items.indexWhere((item) => item['id'] == id);
    if (newItems != -1) {
      items[newItems]['count'] = count;
    } else {
      _items.add({
        'id': id,
        'name': name,
        'price': price,
        'image': image,
        'status': status,
        'count': count,
      });
    }
    notifyListeners();
  }

  void clearItems() {
    _items.clear();
    _count = 0;
    _totalPrice = 0;
    notifyListeners();
  }
}
