import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  int _count = 0;
  double _totalPrice = 0;
  int get count => _count;
  double get totalPrice => _totalPrice;
  List<Map<String, dynamic>> get items => [];

  setTotalPrice({required double total}) {
    _totalPrice = total;
    notifyListeners();
  }

  setCount({required int count}) {
    _count = count;
    notifyListeners();
  }
}
