import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_feiniao_shop/components/BannerComponent.dart';
import 'package:flutter_feiniao_shop/apis/home_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _searchBoxHeight = 80.0;

  var _searchTextAlignment;

  TextEditingController _keywordController = TextEditingController();

  FocusNode _focusNode = FocusNode(); //获取焦点和失去焦点事件

  List _bannerList;  //banner导航列表

  @override
  void initState() {
    super.initState();
    _searchTextAlignment = TextAlign.center;
    this._keywordController.text = "";

    _focusNode.addListener((){
      if(_focusNode.hasFocus){   //获取焦点
        setState(() {
          _searchTextAlignment = TextAlign.start;
        });
      }else{
        setState(() {
          _searchTextAlignment = TextAlign.center;
        });
        this.homePageSearch();
      }
    });

    this.getBannerList();

  }

  //获取banner导航列表
  void getBannerList(){
    HomeApi().getBannerList().then((response){
      setState(() {
        this._bannerList = response;
      });
    });
  }

  //todo 根据关键词查询
  void homePageSearch(){
    String keyword  = this._keywordController.text;
    if(keyword == "") return;
    HomeApi().homePageSearch(keyword).then((response){
      print(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
          Positioned(
            top: ScreenUtil().setHeight(_searchBoxHeight),
            child: _homeBodyBox(),
          ),
            _searchBox(),
          ],
        ),
      ),
    );
  }

  //搜索框
  Widget _searchBox(){
    return Container(
      height: ScreenUtil().setHeight(_searchBoxHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: TextField(
        focusNode:_focusNode,
        controller: _keywordController,
        decoration: InputDecoration(
          hintText: "搜你想搜的..",
          icon: Icon(Icons.search),
        ),
        textAlign: _searchTextAlignment,
        onChanged: (_value){
          this.setState((){
            this._keywordController.text = _value;
          });
        },
      ),
    );
  }

  //首页主体部分
  Widget _homeBodyBox(){
    return Container(
      child: Column(
        children: <Widget>[
          BannerComponent(dataList:_bannerList), // banner导航
          
        ],
      ),
    );
  }






}
