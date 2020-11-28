import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'ordereditems.dart';
import 'orderedmenue.dart';
import 'package:flutter/widgets.dart';


class OrderModel extends ChangeNotifier{
  List<OrderedItem> _orders = [];
  int _selectedIndex = 0;
  void setSelectedIndex(int value) {
    _selectedIndex = value;
  }
  void setOrders(List<OrderedItem> newOrders) {
    _orders = newOrders;
    notifyListeners();
  }

  List<OrderedItem> get orders => _orders;
  OrderedItem get selectedOrders => _orders[_selectedIndex];
  int get length => _orders.length;

  void add(OrderedItem order) {
    _orders.add(order);
    notifyListeners();
  }
  void remove(OrderedItem value) {
    _orders.remove(value);
    notifyListeners();
  }


}