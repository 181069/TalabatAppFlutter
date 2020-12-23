import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dotted_border/dotted_border.dart';
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
      backgroundColor: Colors.grey[100],


      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.red[700],
        centerTitle: true,
        titleSpacing: 3,
        title: Row(
          children: [
            Column(
              mainAxisAlignment:MainAxisAlignment.start ,
              children: [
                IconButton(
                  onPressed: () {
                    print('done');
                  },
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                Text('home',style:TextStyle(fontSize:10) ,),

              ],
            ),

            Text(
              '   Talabat ',
               style: TextStyle(fontSize:35,color: Colors.white,fontFamily:'ArchitectsDaughter Regular')
            ),
          ],
        ),
        leading: Column(
          children: [
            IconButton(
              tooltip:'faviorate' ,
              onPressed: () {
                print('done');
              },
              icon: Icon(
                Icons.star,
                color: Colors.white,
                size: 35,
              ),
            ),
            Text('faviorate',style:TextStyle(fontSize:10) ,),
          ],
        ),
        actions: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  print('done');
                },
                icon: Icon(
                  Icons.map,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              Text('map',style:TextStyle(fontSize:10) ,),

            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  print('done');
                },
                icon: Icon(
                  Icons.local_grocery_store,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              Text('card',style:TextStyle(fontSize:10) ,),

            ],
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin:EdgeInsets.fromLTRB(0, 10, 0, 7) ,
            child: DottedBorder(
              color: Colors.red[700],
              dashPattern: [12,12, 12, 12],

              strokeWidth:3,
              child: Text(' Resturants List ',style:TextStyle(fontSize:30,color: Colors.red[700],fontFamily:'ArchitectsDaughter Regular') ,),
            ),
          ),
          Container(
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: resturants.length,
              itemBuilder: (context, index) {
                return Container(
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
                                  width: 300,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "http://appback.ppu.edu/static/${resturants[index].image}"),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            resturants[index].name,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            resturants[index].city,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          child: CircleAvatar(
                                            backgroundColor: Colors.black12,
                                            child: Icon(
                                              Icons.restaurant_menu,
                                              size: 20,
                                              color: Colors.red,
                                            ),
                                            minRadius: 20,
                                            maxRadius: 20,
                                          ),
                                          onTap: () {
                                            print(resturants);

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Loading2(
                                                          index + 1,
                                                          resturants[index]
                                                              .name),
                                                ));
                                          },
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              6, 0, 0, 0),
                                          child: RatingBar.builder(
                                            itemSize: 20,
                                            initialRating:
                                                resturants[index].rating / 2,
                                            minRating: 1,
                                            ignoreGestures: true,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 4.0),
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
              },
            ),
          ),
          FlatButton(
            color: Colors.red,
            child: Text('go to fav'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavPage(),
                  ));
            },
          ),
          FlatButton(
            color: Colors.red,
            child: Text('go to Map'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapPage(resturants),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
