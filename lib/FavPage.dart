import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProviderTalabat.dart';
import 'ordereditems.dart';
import 'orderedmenue.dart';

class FavPage extends StatefulWidget {
  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {

  @override
  Widget build(BuildContext context) {
    var menitem = Provider.of<ProviderTalabat>(context);

    return Scaffold(
      appBar:AppBar(
        title:Text('Faviorate Items Page') ,

      ) ,
      body:Column(
        children: [
          Text('Faviorate Items'),
          Expanded(
            child:ListView.builder(
                itemCount:menitem.fav.length ,
                // ignore: missing_return
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:IconButton(
                      icon:Icon(Icons.add) ,
                      onPressed:() {
                        menitem.add(menitem.fav[index]);
                        Navigator.push(context, MaterialPageRoute(builder:(context) => Ordereditem(),));

                      } ,
                    ) ,
                    title:Text(menitem.fav[index].name) ,
                    subtitle:Text(' price: ${menitem.fav[index].price} shekel') ,
                    trailing:IconButton(
                      icon:Icon(Icons.clear) ,
                    onPressed: () {
                      menitem.removefav(index);
                    },
                    ) ,
                  );
                },) ,
          ),

        ],
      ) ,
    );
  }
}
