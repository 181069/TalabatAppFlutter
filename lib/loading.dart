import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:proj2fatisr/FavItem.dart';
import 'package:proj2fatisr/ProviderTalabat.dart';
import 'package:proj2fatisr/database_provider.dart';
import 'package:proj2fatisr/errorPage.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'resturants.dart';
import 'resturanpage.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  List<Res> resturants = [];
  void fetchRest() async {
    http.Response response = await http.get('http://appback.ppu.edu/restaurants');
    if(response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;
      print(jsonArray);
      resturants = jsonArray.map((e) => Res.fromJson(e)).toList();

    }
    else{
      throw Exception('Failed to load Resturants try another time');
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ErrorPage(),));
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResturantPage(resturants),));
  }
  @override
  void initState() {

    super.initState();
    fetchRest();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' Talabat',style:TextStyle(fontFamily:'ArchitectsDaughter Regular' ,fontSize:70,color:Colors.white )),
            Icon(Icons.restaurant,size:90,color:Colors.white ,),
          ],
        ),
      ),
    );
  }
}
