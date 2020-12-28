import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj2fatisr/FavItem.dart';
import 'package:proj2fatisr/database_provider.dart';
import 'package:proj2fatisr/resturantitem.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'ordereditems.dart';
class ProviderTalabat with ChangeNotifier{
List<OrderedItem> ordereditem=[];
List<FavItem>  fav=[];
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
  void addfav(FavItem item) {
  for(int i=0;i<fav.length;i++){
   if((item.name==fav[i].name)&&(item.rest_Name==fav[i].rest_Name)){
    notifyListeners();
    return;

   }

  }
  fav.add(item);

  DatabaseProvider.db.insert(FavItem(
                     id: item.id,
      rest_Name: item.rest_Name,
      name: item.name,
      descr: item.descr,
      image: item.image,
      price: item.price))
                      .then((value) {
                    print(value);
                  });

  notifyListeners();

  }
  void removefav(int id,int index) {
   DatabaseProvider.db.removefavorite(id).then((value) {
    if(value==1){ }
    print(value);
   });

   fav.removeAt(index);


   notifyListeners();
  }
}
