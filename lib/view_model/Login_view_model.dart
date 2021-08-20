import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier{
bool passwordvisible=true;

void onclick(){
  passwordvisible=!passwordvisible;
  notifyListeners();
}

}