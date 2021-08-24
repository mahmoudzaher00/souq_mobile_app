import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:untitled1/model/db/Favorites.dart';
import 'package:untitled1/model/db/db_helper.dart';

class FavoriteViewModel extends ChangeNotifier{
  bool _isfav = false;
  bool get isfav => _isfav;

  void onclick(){
    _isfav=!_isfav;
    notifyListeners();
  }

  List<Favorites> _FavoritesList = [];

  List get FavoritesList => _FavoritesList;

  var helper = DbHelper();

  void addFav(Favorites favorites,BuildContext context) async {
    int row = await helper.addNewFavorites(favorites);
    if (row != 0) {
      Toast.show("1 Product added to favorite", context);
    }
    notifyListeners();
  }
  Future<List<Favorites>> viewAllFavorites() async{
    helper.getAllFavorites().then((map){
      _FavoritesList = map ;
    }
    );
    notifyListeners();
    //print("Data returned => ${_filmList}");
  }
}