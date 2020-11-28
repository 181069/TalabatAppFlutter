import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:proj2fatisr/ProviderTalabat.dart';
import 'package:provider/provider.dart';
import 'ordereditems.dart';
import 'menupage.dart';
import 'menupage.dart';
import 'resturantitem.dart';
import 'menupage.dart';
import 'main.dart';
import 'package:flutter/material.dart';
class Ordereditem extends StatefulWidget {
  @override
  _OrdereditemState createState() => _OrdereditemState();
}
class _OrdereditemState extends State<Ordereditem> {
  @override
  Widget build(BuildContext context) {
    var menitem = Provider.of<ProviderTalabat>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Ordered Menue"),
      ),
      body: ListView.builder(
        itemCount: menitem.ordereditem.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150.0,
                  margin:EdgeInsets.all(10.0),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(


                        leading: Container(
                          child: Column(
                            children: [

                              Text(menitem.ordereditem[index].rest_name),
                            ],
                          ),
                        ),
                        title: Text(menitem.ordereditem[index].name),
                        subtitle: Text('This is for the price ${menitem.ordereditem[index].price}'),
                        trailing: IconButton(

                          icon: Icon(Icons.delete),
                          onPressed:(){}  ,

                        ),


                      ),
                    ],
                  ),
                ),





              ],



              ),
            );


          }

          ),


    );
  }


}
