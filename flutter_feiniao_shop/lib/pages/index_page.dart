import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cart_page.dart';
import 'category_page.dart';
import 'home_page.dart';
import 'member_page.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {


  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = _tabBodies[currentIndex];
  }

  List<BottomNavigationBarItem> _bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      title: Text("分类"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text("购物车"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people),
      title: Text("个人"),
    ),
  ];

  List<Widget> _tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context); //iphone6 必须build里写

    return Scaffold(
      appBar: AppBar(title: Text('飞鸟商城'),centerTitle:true),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: _bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = _tabBodies[currentIndex];
          });
        },
      ),
      body: IndexedStack(  //状态保持
        index: currentIndex,
        children: _tabBodies,
      ),
    );
  }


}