import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'ordereditems.dart';
import 'menupage.dart';
import 'menupage.dart';
import 'resturantitem.dart';
import 'menupage.dart';
import 'main.dart';
import 'package:flutter/material.dart';
class Ordereditem extends StatefulWidget {

 final List <OrderedItem> orders;
  Ordereditem(this.orders);

  @override
  _OrdereditemState createState() => _OrdereditemState(orders);
}

class _OrdereditemState extends State<Ordereditem> {
  _OrdereditemState(this.orders);
  List <OrderedItem> orders;

   deleteitem (){}
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ordered Menue"),
      ),
      body: ListView.builder(
        itemCount: orders.length,
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

                              Text("This is the order"),
                            ],
                          ),
                        ),
                        title: Text("${orders[index].name}"),
                        subtitle: Text("This is for the price"),
                        trailing: IconButton(

                          icon: Icon(Icons.delete),
                          onPressed: deleteitem()   ,

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
