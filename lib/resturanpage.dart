import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proj2fatisr/googlemap.dart';
import 'package:proj2fatisr/loading2.dart';
import 'package:proj2fatisr/resturantitem.dart';
import 'package:proj2fatisr/resturants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import 'FavPage.dart';


class ResturantPage extends StatefulWidget {
  final List<Res> resturants;

  ResturantPage(this.resturants);

  @override
  _ResturantPageState createState() => _ResturantPageState(resturants);
}

class _ResturantPageState extends State<ResturantPage> {
  List<Res> resturants;

  _ResturantPageState(this.resturants);


  @override
  void initState() {
    super.initState();
  }



  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar:

        ConvexAppBar(
          backgroundColor: Colors.red[50],
          items: [
            TabItem(icon: Icons.star, title: 'faviorate'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.shopping_cart , title: 'card'),
            TabItem(icon: Icons.add, title: 'Add'),
          ],
          initialActiveIndex: 2,//optional, default as 0
          onTap: (int i){

          },
        ),
      appBar: AppBar(title: Text('Resturant List'),),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton(
            color: Colors.blueAccent,
            child:Text('go to fav') ,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => FavPage(),));

            },
          ),

          FlatButton(
            color: Colors.blueAccent,
            child:Text('go to Map') ,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => MapPage(resturants),));

            },
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection:Axis.horizontal ,
                itemCount:resturants.length ,
                itemBuilder:(context, index) {
                  return  Container(
                    child: Column(

                      children: [

                        Container(
                          height: 250,
                          margin: const EdgeInsets.all(2),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            shadowColor: Colors.black,
                            elevation: 50,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //this one
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width,
                                    height: 150,
                                    width:300 ,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage("http://appback.ppu.edu/static/${resturants[index].image}"),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.start ,
                                    crossAxisAlignment:CrossAxisAlignment.center ,
                                   children: [

                                      Container(
                                        margin:const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              resturants[index].name,
                                              style: TextStyle(color: Colors.black, fontSize: 15),
                                            ),
                                            Text(
                                                resturants[index].city,
                                              style: TextStyle(color: Colors.black, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                        crossAxisAlignment:CrossAxisAlignment.center ,
                                          children: [

                                          GestureDetector(
                                            child:CircleAvatar(
                                              backgroundColor: Colors.black12,
                                              child: Icon(
                                                Icons.restaurant_menu,
                                                size: 20,
                                                color: Colors.red,
                                              ),
                                              minRadius: 20,
                                              maxRadius: 20,
                                            ),
                                            onTap:() {
                                              print(resturants);

                                              Navigator.push(context, MaterialPageRoute(builder:(context) => Loading2(index+1, resturants[index].name),));
                                            } ,
                                          ),
                                          Container(
                                            margin:const EdgeInsets.fromLTRB(6, 0, 0, 0),

                                            child: RatingBar.builder(
                                              itemSize:20,

                                              initialRating: resturants[index].rating/2,
                                              minRating: 1,
                                              ignoreGestures:true,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,

                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          )

                                        ],
                                      ),
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
          ),
        ],
      ) ,
    );
  }
}
