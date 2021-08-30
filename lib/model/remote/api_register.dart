import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:http/http.dart';

class ApiRegister{
  static ApiRegister? _apiRegister;
  ApiRegister._getInstance();
  factory ApiRegister(){
    if(_apiRegister==null){
      return _apiRegister=ApiRegister._getInstance();
    }else return _apiRegister!;
  }
  Future<http.Response>fetchproduct()async{
    String Url='https://student.valuxapps.com/api/register';
    Response response = await http.post(Uri.parse(Url));
    // print(response.body);
    return response;
  }
}