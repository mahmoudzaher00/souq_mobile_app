import 'package:flutter/material.dart';
import 'package:untitled1/model/Profile.dart';
import 'package:untitled1/model/UpdateProfile.dart';
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


  UpdateProfile updateProfile;

  void getUpdateProfile({String name,String phone,String email}){
    DioHelper.putData(
        url: "update-profile",
        data: {
          'name' :name,
          'phone':phone,
          'email':email
        },
        token:  MySharedPreferences.getData(key: "token")
    ).then((value) {
       print(value.data);
      updateProfile =UpdateProfile.fromJson(value.data);
      return updateProfile;
    }).catchError((error) {
      print(error.toString());
    });
  }


}

