import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj2fatisr/resturantitem.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'ordereditems.dart';
class ProviderTalabat with ChangeNotifier{
List<OrderedItem> ordereditem=[];
List<OrderedItem>  fav=[];
 void add(OrderedItem item) {
   ordereditem.add(item);
    notifyListeners();
  }
  void removeAllOrdered(){
  ordereditem.clear();
  notifyListeners();

  }
  void remove(int index) {
   ordereditem.removeAt(index);
    notifyListeners();
  }
  void addfav(OrderedItem item) {
  for(int i=0;i<fav.length;i++){
   if((item.name==fav[i].name)&&(item.rest_name==fav[i].rest_name)){
    notifyListeners();
    return;

   }

  }
  fav.add(item);
  notifyListeners();

  }
  void removefav(int index) {
   fav.removeAt(index);
    notifyListeners();
  }
}
