import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/widgets/custom_bottomNavigationTwo.dart';
import 'package:untitled1/view_model/Cart_View_Model.dart';
import 'package:untitled1/view_model/Product_view_model.dart';
import 'package:untitled1/view_model/Profile_view_model.dart';


class SplashScreenTwo extends StatefulWidget {
  @override
  _SplashScreenTwoState createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
var _isInit = true;

@override
  void didChangeDependencies() {
    if(_isInit){
     Provider.of<ProductProvider>(context).fetchProduct();
     ProfileViewModel.getProfileData();
     Provider.of<CartViewModel>(context).getCartData();


      gotoNext();
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
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
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CustomBottomNavigationBarTwo()));
    }
    );
  }
}
