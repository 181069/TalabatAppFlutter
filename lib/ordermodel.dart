import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'ordereditems.dart';
import 'orderedmenue.dart';
import 'package:flutter/widgets.dart';


class OrderModel extends ChangeNotifier{
  List<OrderedItem> orders = [];
  void add(OrderedItem order) {
   orders.add(order);
    notifyListeners();
  }
  void remove(OrderedItem value) {
    orders.remove(value);
    notifyListeners();
  }


}