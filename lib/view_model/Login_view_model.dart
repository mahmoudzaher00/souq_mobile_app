import 'package:flutter/material.dart';
import 'package:untitled1/model/Login.dart';
import 'package:untitled1/model/Profile.dart';
import 'package:untitled1/view/shared/Network/local/shared_pref.dart';
import 'package:untitled1/view/shared/Network/remote/dio_helper.dart';
import 'package:untitled1/view/shared/components/components.dart';
import 'package:untitled1/view/shared/components/constants.dart';
import 'package:untitled1/view/widgets/custom_bottomNavigationTwo.dart';

import 'Profile_view_model.dart';

class LoginViewModel extends ChangeNotifier{
bool _passwordvisible=true;

bool get passwordvisible => _passwordvisible;

  void onclick(){
  _passwordvisible=!_passwordvisible;
  notifyListeners();
}
Login loginmodel;
Profile profileModel;

  void userLogin({@required String email,@required String password,BuildContext context})
  {
    notifyListeners();
    DioHelper.postData(
        url:"login",
        data: {
      'email':email,
      'password':password,
    }
    ).then((value) {
      print(value.data);
      loginmodel = Login.fromJson(value.data);
      if (loginmodel.status == true && loginmodel.status != null) {
        MySharedPreferences.saveData(
            key: 'token',
            value: loginmodel.data.token).then((value) {
          token = loginmodel.data.token;
          ProfileViewModel.getProfileData();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) => CustomBottomNavigationBarTwo()), (
              Route<dynamic> route) => false);
        });
        return loginmodel;
      }
      else if (loginmodel.status == false || loginmodel.status == null) {
        makeToast(loginmodel.message);
        return loginmodel;
      }
    }).catchError((error){
      print(error.toString());
      notifyListeners();
    });
    notifyListeners();
  }

}