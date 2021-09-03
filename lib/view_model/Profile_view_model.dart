import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:untitled1/model/Profile.dart';
import 'package:untitled1/view/shared/Network/local/shared_pref.dart';
import 'package:untitled1/view/shared/Network/remote/dio_helper.dart';

class ProfileViewModel extends ChangeNotifier{
  static Profile profileModel;


  static void getProfileData(){

   DioHelper.getData(url: 'profile', token : MySharedPreferences.getData(key: "token")).
   then((value) {
     print(value.data);
     profileModel= Profile.fromJson(value.data);
     return profileModel;
   }).catchError((error) {
     print(error.toString());


   });

  }
}

// if(profileModel.status == true && profileModel.status != null)
// {
//   notifyListeners();
//   return profileModel;
// }
// else if(profileModel.status == false || profileModel.status == null){
//   print(profileModel.message);
//
//   return profileModel;
// }