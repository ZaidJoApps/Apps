import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String url ;
  NetworkHelper({@required this.url});
  Future getWeatherData()async{
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    print(response.body);
    var weatherJson = jsonDecode(response.body);
    //print(weatherJson['main']['temp'].toString());
    if (response.statusCode == 200) {
      return weatherJson;
    }else{
      print(response.statusCode);
    }
  }

}