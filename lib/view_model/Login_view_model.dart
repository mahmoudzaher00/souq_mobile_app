import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier{
bool _passwordvisible=true;

bool get passwordvisible => _passwordvisible;

  void onclick(){
  _passwordvisible=!_passwordvisible;
  notifyListeners();
}

}