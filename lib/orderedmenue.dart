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
     List<OrderedItem> fat=menitem.ordereditem;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.red[700] ,
        title: Text("Ordered Menue",style:TextStyle(fontFamily:'ArchitectsDaughter Regular' ,fontSize:25 ) ),
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: menitem.ordereditem.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(

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
                                onPressed:(){
                                  menitem.remove(index);
                                }  ,

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
          ),
          Column(
            children: [
              Text('Total price ${_totalprice(menitem.ordereditem) } '
                  'shekel',style: TextStyle(fontSize:20,  ),),
              FlatButton( color:Colors.red[700] ,
                  onPressed: () {
                 menitem.removeAllOrdered();
                },
                  child: Text('confirmand and send'))
            ],
          ),
        ],
      ),


    );
  }
 double _totalprice(List<OrderedItem> fat){
    double sum=0.0;
    for(int i=0;i<fat.length;i++){
      sum=sum+fat[i].price;
    }
    return sum;
 }

}
