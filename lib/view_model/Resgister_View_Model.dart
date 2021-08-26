import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/model/remote/Register.dart';

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
    // BaseOptions options = new BaseOptions(
    //     connectTimeout: 5000,
    //     receiveTimeout: 3000,
    //     validateStatus: (code) {
    //       if(code==406){
    //         return true;
    //       }
    //       return true;
    //     }
    //
    // );
    notifyListeners();
    Dio _dio = Dio();
    //_dio.options.contentType = Headers.formUrlEncodedContentType;
    final _result = await _dio.post('https://student.valuxapps.com/api/register',
      data: jsonMap,
    );
    final Register registerResponse = Register.fromJson(_result.data);
    print(registerResponse.message);
    if(registerResponse.status == false){
      print(registerResponse.message);
      print(registerResponse.status);
      return registerResponse;
    }
    else{
      print(registerResponse.status);
      print(registerResponse.message);
     // print(registerResponse.data.name);
      return registerResponse;
    }
    notifyListeners();
  }


}