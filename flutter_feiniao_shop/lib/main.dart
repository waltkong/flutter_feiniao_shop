import 'package:flutter/material.dart';
import 'package:flutter_feiniao_shop/pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: MaterialApp(
        title: "飞鸟商城",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        home: Container(
          child: IndexPage(),
        ),
      ),

    );
  }
}