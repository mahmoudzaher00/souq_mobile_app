import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/model/Cart.dart';
import 'package:untitled1/model/db/CartModel.dart';
import 'package:untitled1/view/screens/CartScreen.dart';
import 'package:untitled1/view/shared/Network/local/shared_pref.dart';
import 'package:untitled1/view/shared/Network/remote/dio_helper.dart';
import 'package:untitled1/view/shared/components/components.dart';

class CartViewModel extends ChangeNotifier{
  Cart postCart;

 static Cartgetmodel getCart;

  void PostCartData({@required int id,}) {
    DioHelper.postData(
        url: 'carts',
        data: {"product_id":id},
        token:MySharedPreferences.getData(key:'token')
    ).then((value) {
      print(value.data);
      postCart = Cart.fromJson(value.data);
      if(postCart.status==true && postCart.status!=null){
        return postCart;
    }else if(postCart.status==false||postCart.status==null){
        makeToast(postCart.message);
        return postCart;
      }}).catchError((error){
      print(error.toString());
      notifyListeners();
    });
    notifyListeners();
  }



 static void getCartData(){
    DioHelper.getData(
      url: "carts",
      token: MySharedPreferences.getData(key: 'token')
    ).then((value) {
      print(value.data);
      getCart = Cartgetmodel.fromJson(value.data);
      return getCart;
    }).catchError((error) {
      print(error.toString());
    });


  }


}