import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/widgets/custom_bottomNavigationTwo.dart';
import 'package:untitled1/view_model/Cart_View_Model.dart';
import 'package:untitled1/view_model/Product_view_model.dart';


class SplashScreentwo extends StatefulWidget {
  @override
  _SplashScreentwoState createState() => _SplashScreentwoState();
}

class _SplashScreentwoState extends State<SplashScreentwo> {
  @override
  void initState() {
    ProductProvider.fetchproduct();
    //CartViewModel.getCartData();
    gotoNext();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CartViewModel cartModel = Provider.of<CartViewModel>(context);
    cartModel.getCartData();
   // CartViewModel.x =CartViewModel.getCart.data.cartItems;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'images/img2.png',
        ),
      ),
    );
  }

  gotoNext() {
    Timer(Duration(seconds: 10), () {

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CustomBottomNavigationBarTwo()));
    }
    );
  }
}
