import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:toast/toast.dart';
import 'package:untitled1/model/db/Favorites.dart';
import 'package:untitled1/model/db/db_helper.dart';
import 'package:untitled1/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
      //Toast.show("${LocaleKeys.addfavorites.tr()}", context);
      Fluttertoast.showToast(msg: '${LocaleKeys.addfavorites.tr()}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0
      );
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
  void deletefav(Favorites favorites,BuildContext context) async{
    helper.deleteFavorites(favorites).then((value) {
      //Toast.show('${LocaleKeys.deletefavorites.tr()}', context);
      Fluttertoast.showToast(msg: '${LocaleKeys.deletefavorites.tr()}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0
      );
      viewAllFavorites();
    });
    notifyListeners();

  }

}