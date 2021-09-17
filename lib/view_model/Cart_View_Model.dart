import 'package:flutter/material.dart';
import 'package:untitled1/model/Cart.dart';
import 'package:untitled1/model/GetCartModel.dart';
import 'package:untitled1/model/db/CartModel.dart';
import 'package:untitled1/view/shared/Network/local/shared_pref.dart';
import 'package:untitled1/view/shared/Network/remote/dio_helper.dart';


class CartViewModel extends ChangeNotifier{

  Cart postCart;

  void PostCartData({@required int id,}) {
    DioHelper.postData(
        url: 'carts',
        data: {"product_id":id},
        token:MySharedPreferences.getData(key:'token')
    ).then((value) {
     //print(value.data);
      postCart = Cart.fromJson(value.data);
      notifyListeners();
      return postCart;

    //   if(postCart.status==true ){
    //     return postCart;
    // }else if(postCart.status==false){
    //     makeToast(postCart.message);
    //     return postCart;
    //   }
    }).catchError((error){
      print(error.toString());

    });


  }




  GetCartModel getCart;

   void getCartData(){
    DioHelper.getData(
      url: "carts",
      token: MySharedPreferences.getData(key: 'token')
    ).then((value) async {
      print("${value.data} + mooooooooooooooo");
      getCart = GetCartModel.fromJson(value.data);
      notifyListeners();
      return getCart;


      // if(getCart.status==true ){
      //   return getCart;
      // }else if(getCart.status==false){
      //   makeToast(getCart.message);
      //   return getCart;
      // }
    }).catchError((error){
      print(error.toString());

    });


  }


}