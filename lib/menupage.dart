import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'ProviderTalabat.dart';
import 'resturantitem.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'orderedmenue.dart';
import 'ordereditems.dart';
class Menu extends StatefulWidget {
  final List<RestuItem> menues;
  Menu(this.menues);

  @override
  _MenuState createState() => _MenuState(menues);
}

class _MenuState extends State<Menu> {
  List<RestuItem> menues;
  _MenuState(this.menues);

  @override
  Widget build(BuildContext context) {
    var menitem = Provider.of<ProviderTalabat>(context);
   List<OrderedItem> ordereditem=[];

    return  Scaffold(
      appBar: AppBar(title: Text('Menu'),),
      body:ListView.builder(
        itemCount:menues.length ,
        itemBuilder:(context, index) {
          return  Container(
            child: Column(

                  children: [

                    Container(
                      margin: const EdgeInsets.all(2),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        shadowColor: Colors.black,
                        elevation: 50,
                        color: Colors.white,
                        child: Column(
                          children: [
                            //this one
                            Container(
                              // width: MediaQuery.of(context).size.width,
                              height: 100,

                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage("http://appback.ppu.edu/static/${menues[index].image}"),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: [
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                    children: [

                                      Column(
                                        crossAxisAlignment:CrossAxisAlignment.start ,
                                        children: [
                                          Text(
                                            menues[index].name,
                                            style: TextStyle(color: Colors.indigo, fontSize:15),
                                          ),
                                          Text('price: ${menues[index].price} shekel',
                                            style: TextStyle(color: Colors.black, fontSize: 10),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          GestureDetector(
                                            child:CircleAvatar(
                                              backgroundColor: Colors.black12,
                                              child: Icon(
                                                Icons.add,
                                                size:20,
                                                color: Colors.black,
                                              ),
                                              minRadius: 18,
                                              maxRadius:18,
                                            ),
                                            onTap:() {
                                              print(menues[index].name);
                                              print(menues[index].price);
                                              print(menues[index].id);
                                              menitem.ordereditem.add(OrderedItem(name:menues[index].name ,price:menues[index].price ,rest_name:'${menues[index].rest_id} '));
                                              Navigator.push(context, MaterialPageRoute(builder:(context) => Ordereditem(),));

                                            }

                                          ),
                                          RatingBar.builder(
                                            initialRating: 0,
                                            itemCount: 5,
                                            itemSize:20 ,
                                            itemBuilder: (context, index) {
                                              switch (index) {
                                                case 0:
                                                  return Icon(
                                                    Icons.sentiment_very_dissatisfied,
                                                    color: Colors.red,
                                                  );
                                                case 1:
                                                  return Icon(
                                                    Icons.sentiment_dissatisfied,
                                                    color: Colors.redAccent,
                                                  );
                                                case 2:
                                                  return Icon(
                                                    Icons.sentiment_neutral,
                                                    color: Colors.amber,
                                                  );
                                                case 3:
                                                  return Icon(
                                                    Icons.sentiment_satisfied,
                                                    color: Colors.lightGreen,
                                                  );
                                                case 4:
                                                  return Icon(
                                                    Icons.sentiment_very_satisfied,
                                                    color: Colors.green,
                                                  );
                                              }
                                            },
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),


                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(menues[index].descr,style: TextStyle(fontSize:12,color:Colors.indigo  )),
                                ],
                              ),
                            ),

                            //LIST CONTAINERS
                          ],
                        ),
                      ),
                    ),
                    //icon containers
                  ],
                ),
              );
            },),


    );

  }
}
