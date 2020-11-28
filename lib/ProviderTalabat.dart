import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ordereditems.dart';
class ProviderTalabat with ChangeNotifier{
List<OrderedItem> ordereditem=[];
 void add(OrderedItem item) {
   ordereditem.add(item);
    notifyListeners();
  }
  void remove(int index) {
   ordereditem.remove(index);
    notifyListeners();
  }
}
