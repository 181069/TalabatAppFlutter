import 'package:flutter/material.dart';
import 'package:proj2fatisr/loading2.dart';
import 'package:proj2fatisr/resturantitem.dart';
import 'package:proj2fatisr/resturants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

/* 1.	Name
class MainPage extends StatefulWidget {

  final List<Todo> todo;
  MainPage(this.todo);

  @override
  _MainPageState createState() => _MainPageState(todo);
}

class _MainPageState extends State<MainPage> {
  List<Todo> todo;

  _MainPageState(this.todo);
*/

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
      appBar: AppBar(title: Text('Resturant List'),),
      body:ListView.builder(
          itemCount:resturants.length ,
          itemBuilder:(context, index) {
            return  Container(
              child: Column(

                children: [

                  Container(
                    height: 190,
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
                                image: NetworkImage("http://appback.ppu.edu/static/${resturants[index].image}"),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Column(
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
                                Row(
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

                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Loading2(index+1),));
                                      } ,
                                    ),
                                    RatingBar.builder(
                                      itemSize:20,
                                      initialRating: resturants[index].rating/2,
                                      minRating: 1,
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
          },) ,
    );
  }
}
