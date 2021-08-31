import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:http/http.dart';

class ApiServices{
  static ApiServices _apiServices;
  ApiServices._getInstance();
  factory ApiServices(){
    if(_apiServices==null){
      return _apiServices=ApiServices._getInstance();
    }else return _apiServices;
  }
  Future<http.Response>fetchproduct()async{
    String Url='https://student.valuxapps.com/api/products';
    Response response = await http.get(Uri.parse(Url));
   // print(response.body);
    return response;
  }
}