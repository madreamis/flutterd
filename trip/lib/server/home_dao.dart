import 'dart:async';
import 'dart:convert';
import 'package:trip/model/home_model.dart';
import 'package:http/http.dart' as http;
const HOME_URL='http://www.devio.org/io/flutter_app/json/home_page.json';
class HomeDao{
  static Future<HomeModel> fetch() async{
    final response = await http.get(HOME_URL);
    if(response.statusCode==200){
      Utf8Decoder utf8coder=Utf8Decoder();//fix中文乱码
      var result =json.decode(utf8coder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    }else{
      throw Exception("失败");
    }
  }
}