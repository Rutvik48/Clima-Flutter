import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class Networking {

  final String url;

  Networking({@required this.url});

  Future<dynamic> getData() async {
    print('Network Calling...');
    http.Response res = await http.get(url);

    if (res.statusCode == 200){
      var data = jsonDecode(res.body);
      print(data);
      return data;

//      var decodedData = jsonDecode(data);
//      String city = decodedData['name'];
//      int conditionNum = decodedData['weather'][0]['id'];
//      double temp = decodedData['main']['temp'];
//
//      print(city);
//      print(conditionNum);
//      print(temp);

    } else {
      print(res.statusCode);
      print("Exception throuwn. Response.statusCode is not 200.");
    }

  }
}