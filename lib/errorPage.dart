import 'package:flutter/material.dart';
class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.red[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('sorry but there is an error check your internet connection',style:TextStyle(fontFamily:'ArchitectsDaughter Regular' ,fontSize:70,color:Colors.white )),
            Icon(Icons.sentiment_very_dissatisfied,size:120,color:Colors.white ,),
          ],
        ),
      ),
    );
  }
}
