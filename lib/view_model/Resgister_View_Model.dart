import 'package:flutter/material.dart';

class SignupViewModel extends ChangeNotifier{
  bool passwordvisible =true;
  bool passwordConfirm =true;


  void onclick(){
    passwordvisible=!passwordvisible;
    notifyListeners();
  }

  void inClickConfirm(){
    passwordConfirm=!passwordConfirm;
    notifyListeners();
  }

}