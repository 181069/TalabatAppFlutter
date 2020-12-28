import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:proj2fatisr/FavItem.dart';
import 'package:proj2fatisr/resturantitem.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import 'ProviderTalabat.dart';
import 'ordereditems.dart';
import 'orderedmenue.dart';
import 'database_provider.dart';
class FavPage extends StatefulWidget {
  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
 int id;

  @override
  Widget build(BuildContext context) {
    var menitem = Provider.of<ProviderTalabat>(context);
    //List<FavItem> menues=menitem.fav;
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.red[700] ,
        title:Text('Faviorate Items Page',style:TextStyle(fontFamily:'ArchitectsDaughter Regular' ,fontSize:25 )) ,

      ) ,
      body:Column(
        children: [
          Container(
            padding:EdgeInsets.fromLTRB(70, 0, 70, 0) ,
            margin:EdgeInsets.fromLTRB(0, 10, 0, 7) ,
            child: Container(
              padding:EdgeInsets.fromLTRB(15, 0, 15, 0) ,
              child: DottedBorder(
                color: Colors.red[700],
                dashPattern: [12,12, 12, 12],
                strokeWidth:3,
                child: Text('Faviorate List ',style:TextStyle(fontSize:25,color: Colors.red[700],fontFamily:'ArchitectsDaughter Regular') ,textAlign:TextAlign.center ,),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:menitem.fav.length ,
              itemBuilder:(context, index) {
                return Container(
                  child:Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin:EdgeInsets.fromLTRB(7, 7, 7, 7),
                            height:160 ,
                            width:140 ,
                            color:Colors.red[700] ,
                            child:Container(
                                width: MediaQuery.of(context).size.width,
                                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.amber
                                ),
                                child: Image.network('http://appback.ppu.edu/static/${menitem.fav[index].image}',fit:BoxFit.fill ,)
                            ),
                          ),
                          Expanded(
                            child:Column(
                              // mainAxisAlignment:MainAxisAlignment.start ,
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                Text( menitem.fav[index].name,style:TextStyle(fontSize:25,color: Colors.black,fontFamily:'ArchitectsDaughter Regular') ),
                                Text('price: ${menitem.fav[index].price} shekel',style:TextStyle(fontSize:20,color: Colors.black,fontFamily:'ArchitectsDaughter Regular')),
                                Text(menitem.fav[index].descr,style:TextStyle(fontSize:12,color: Colors.black,fontFamily:'ArchitectsDaughter Regular')),
                                Row(
                                  children: [
                                    IconButton(icon:Icon(Icons.add) , onPressed: (){
                                      menitem.add(OrderedItem(name:menitem.fav[index].name ,price:menitem.fav[index].price ,rest_name:menitem.fav[index].rest_Name));
                                      Toast.show('item added to basket succefully', context);
                                    }),
                                    IconButton(icon: Icon(Icons.delete),
                                        onPressed: (){
                                      menitem.removefav(menitem.fav[index].id,index);
                                        }),
                                  ],
                                ),
                              ],
                            )
                            ,),
                        ],
                      ),
                    ],) ,
                );
              },),
          ),

        ],
      ) ,
    );
  }
}

