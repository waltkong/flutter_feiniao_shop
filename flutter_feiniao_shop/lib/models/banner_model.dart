import 'dart:convert';
import 'base_model.dart';

//banner模型
class BannerModel{
  String id;
  String image;  //图片地址
  String name;  //名称
  String url; //跳转地址

  BannerModel({
    this.id,
    this.image,
    this.name,
    this.url
});

  //将Map转换成model
  factory BannerModel.fromJson(Map<String,dynamic> json){
    return BannerModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      url: json['url'],
    );
  }

}



//banner数组模型
class BannerListModel{
  List<BannerModel> models;

  BannerListModel(this.models);

  //将Map转换成model
  factory BannerListModel.fromJson(List json){
    return BannerListModel(
        json.map((i)=>BannerModel.fromJson(i)).toList()
    );
  }

}