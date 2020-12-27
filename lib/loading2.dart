import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'resturantitem.dart';
import 'menupage.dart';
class Loading2 extends StatefulWidget {
 final int id;
 final String resName;


 Loading2(this.id, this.resName);

  @override
  _Loading2State createState() => _Loading2State(id,resName);
}

class _Loading2State extends State<Loading2> {
  int id;
  String resName;
  _Loading2State(this.id, this.resName);

  List<RestuItem> resturantItem = [];
  void fetchMenu() async {
    http.Response response = await http.get('http://appback.ppu.edu/menus/${id}');
    if(response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;
      print(jsonArray);
      print('$id');
      print(' id is $id');
      resturantItem = jsonArray.map((e) => RestuItem.fromJson(e)).toList();
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Menu(resturantItem,resName),));
  }
  @override
  void initState() {
    super.initState();
    fetchMenu();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                ' $resName',style:TextStyle(fontFamily:'ArchitectsDaughter Regular' ,fontSize:45,color:Colors.white )
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                ' welcome you',style:TextStyle(fontFamily:'ArchitectsDaughter Regular' ,fontSize:45,color:Colors.white )
              ),
            ),
            Container(
                padding:EdgeInsets.fromLTRB(95,0,0,0) ,
                child: Icon(Icons.local_dining,size: 75,color: Colors.white,textDirection:TextDirection.rtl ,)),
          ],
        ),
      ),
    );
  }
}
