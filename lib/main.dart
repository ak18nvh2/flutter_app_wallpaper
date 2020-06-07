import 'package:flutter/material.dart';
import 'package:flutter_app/setting.dart';
import 'package:flutter_app/trenddingall.dart';
import 'categories.dart';
import 'home.dart';
import 'img.dart';
import 'apbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Start(),

      debugShowCheckedModeBanner: false,

    );
  }
}
