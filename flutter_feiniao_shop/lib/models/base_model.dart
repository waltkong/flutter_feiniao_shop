//后台接口json格式解析
class BaseModel {

  final String code;
  final String msg;
  final dynamic data;

  BaseModel({
    this.code,
    this.msg,
    this.data,
});

  factory BaseModel.fromJson(Map<String,dynamic> json){
    return BaseModel(
      code: json['code'],
      msg: json['msg'],
      data: json['data'],
    );
  }


}