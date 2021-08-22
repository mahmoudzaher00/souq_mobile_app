import 'package:flutter/material.dart';

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


}