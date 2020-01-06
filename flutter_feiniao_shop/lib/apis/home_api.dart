import 'package:flutter_feiniao_shop/utils/http_util.dart';

class HomeApi{
  //返回future对象

  //获取banner列表
  Future getBannerList() async{
    return await HttpUtil().getHttp("/api/index/bannerList", {});
  }

  //首页搜索
  Future homePageSearch(String keyword) async{
    return await HttpUtil().getHttp("/api/index/bannerList", {keyword:keyword});
  }




}