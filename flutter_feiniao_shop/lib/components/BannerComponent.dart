import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//首页导航组件
class BannerComponent extends StatelessWidget {

  final List dataList;

  BannerComponent({this.dataList}):super();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context,int index){
          return Image.network(dataList[index]['image']);
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }



}

