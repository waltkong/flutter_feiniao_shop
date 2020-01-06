import 'package:flutter/material.dart';
import 'package:flutter_feiniao_shop/configs/web_config.dart' as web_config;
import 'package:dio/dio.dart';


class HttpUtil{

  String getUrl(url){
    String _url = web_config.WebConfig().baseUrl + url;
    return _url;
  }


  Future getHttp(String url,Map data) async{
    try{
      Response response;
//      var data = {
//        'name':typeText
//      };
      response = await Dio().get(this.getUrl(url),queryParameters: data);
      return response.data;
    }catch(e){
      return print(e);
    }
  }

  Future postHttp(String url,Map data) async{
    try{
      Response response;
//      var data = {
//        'name':typeText
//      };
      response = await Dio().post(this.getUrl(url),queryParameters: data);
      return response.data;
    }catch(e){
      return print(e);
    }
  }




}