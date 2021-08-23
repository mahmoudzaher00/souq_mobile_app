import 'package:flutter/material.dart';

class FavoriteViewModel extends ChangeNotifier{
  bool _isfav=false;

  bool get isfav => _isfav;

  void onclick(){
    _isfav=!_isfav;
    notifyListeners();
  }

}