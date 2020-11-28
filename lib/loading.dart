import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
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
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
