import 'package:flutter/material.dart';
import 'package:untitled1/model/Profile.dart';
import 'package:untitled1/model/Register.dart';
import 'package:untitled1/view/screens/SplashScreentwo.dart';
import 'package:untitled1/view/shared/Network/local/shared_pref.dart';
import 'package:untitled1/view/shared/Network/remote/dio_helper.dart';
import 'package:untitled1/view/shared/components/components.dart';
import 'package:untitled1/view/shared/components/constants.dart';
import 'package:untitled1/view_model/Cart_View_Model.dart';
import 'package:untitled1/view_model/Product_view_model.dart';

import 'Profile_view_model.dart';


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
  Profile profileModel;


  // void getProfileData(){
  //   DioHelper.getData(url: 'profile', token : MySharedPreferences.getData(key: "token")).
  //   then((value) {
  //     print(value.data);
  //     profileModel= Profile.fromJson(value.data);
  //     return profileModel;
  //   }).catchError((error) {
  //     print(error.toString());
  //     notifyListeners();
  //
  //   });
  //   notifyListeners();
  // }

  Register registerModel;
  void userRegister(
    {@required String name, @required String email, @required String password, @required String phone,BuildContext context})
  {

    DioHelper.postData(
      url: "register",
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
      ).then((value) {
        print(value.data);
        registerModel= Register.fromJson(value.data);

        if(registerModel.status == true && registerModel.status != null)
        {
          MySharedPreferences.saveData(
            key: 'token',
            value: registerModel.data.token,
          ).then((value) {
            token = registerModel.data.token;
            ProfileViewModel.getProfileData();
            //CartViewModel.getCartData();
            ProductProvider.fetchproduct();
            Navigator.pushAndRemoveUntil
              (context, MaterialPageRoute(builder: (context)=> SplashScreentwo()), (Route<dynamic> route) => false,);

          });
          return registerModel;
        }
        else if(registerModel.status == false || registerModel.status == null){
          makeToast(registerModel.message);
          return registerModel;
        }

      }).catchError((error) {
        print(error.toString());
        notifyListeners();

      });
    notifyListeners();
  }

  // Future<Register> RegisterSendRequest(Map<dynamic, dynamic> jsonMap) async {
  //   Dio _dio = Dio();
  //
  //   BaseOptions options = new BaseOptions(
  //       connectTimeout: 5000,
  //       receiveTimeout: 3000,
  //       followRedirects: false,
  //       receiveDataWhenStatusError: true,
  //       validateStatus: (status) {
  //         return status < 500;
  //       },
  //   );
  //
  //   _dio.options.headers['lang'] = "en";
  //   _dio.options.headers['Content-Type'] = 'application/json';
  //   //_dio.options.contentType = Headers.formUrlEncodedContentType;
  //
  //   final _result = await _dio.post('https://student.valuxapps.com/api/register', data: jsonMap,);
  //
  //   final Register registerResponse = Register.fromJson(_result.data);
  //
  //   print(registerResponse.message);
  //   notifyListeners();
  //   // MySharedPreferences.putDataInSharedPreference(value: registerResponse.data.token, key: 'token')
  //   //     .then((value) {
  //   //    token =  registerResponse.data.token;
  //   //
  //   // });
  //
  //   return registerResponse;
  //
  // }
// if(registerModel.status == true){
//   navigateAndFinish(context,CustomBottomNavigationBarTwo);
//
// }else{
//   makeToast(registerModel.message);
//   return registerModel;
// }


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
