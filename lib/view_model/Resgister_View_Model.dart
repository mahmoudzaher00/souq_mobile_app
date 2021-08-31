import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/model/Register.dart';
import 'package:untitled1/view/shared/Network/local/shared_pref.dart';
import 'package:untitled1/view/shared/components/constants.dart';



class SignupViewModel extends ChangeNotifier{
  bool _passwordvisible =true;
  bool _passwordConfirm =true;


  bool get passwordvisible => _passwordvisible;
  bool get passwordConfirm => _passwordConfirm;

  void onclick(){
    _passwordvisible=!_passwordvisible;
    notifyListeners();
  }

  void inClickConfirm(){
    _passwordConfirm=!_passwordConfirm;
    notifyListeners();
  }



  Future<Register> RegisterSendRequest(Map<dynamic, dynamic> jsonMap) async {
    Dio _dio = Dio();

    BaseOptions options = new BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
        followRedirects: false,
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! < 500;
        },
    );

    _dio.options.headers['lang'] = "en";
    _dio.options.headers['Content-Type'] = 'application/json';
    //_dio.options.contentType = Headers.formUrlEncodedContentType;

    final _result = await _dio.post('https://student.valuxapps.com/api/register', data: jsonMap,);

    final Register registerResponse = Register.fromJson(_result.data);

    print(registerResponse.message);
    notifyListeners();
    MySharedPreferences.putDataInSharedPreference(value: registerResponse.data!.token, key: 'token')
        .then((value) {
       token =  registerResponse.data!.token!;

    });

    return registerResponse;

  }



}























// static Future<Response> postData({
// required String path,
// required Map<String, dynamic>? data,
// Map<String, dynamic>? query,
// String lang = 'en',
// String? token  ,
// }) async {
// dio.options.headers =
// {
// 'lang': lang,
// 'Content-Type':'application/json',
// 'Authorization' : token??'' ,
// }
// ;
// return await dio.post(path,data: data , queryParameters: query);
// }
