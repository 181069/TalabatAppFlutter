import 'package:flutter/material.dart';
import 'package:proj2fatisr/ProviderTalabat.dart';
import 'package:proj2fatisr/loading.dart';
import 'package:proj2fatisr/resturanpage.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider<ProviderTalabat>(
      create:(_) =>ProviderTalabat() ,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Loading(),
    );
  }
}

