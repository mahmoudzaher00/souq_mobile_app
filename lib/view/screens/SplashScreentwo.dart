import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/view/widgets/custom_bottomNavigationTwo.dart';
import 'package:untitled1/view_model/Cart_View_Model.dart';


class SplashScreentwo extends StatefulWidget {
  @override
  _SplashScreentwoState createState() => _SplashScreentwoState();
}

class _SplashScreentwoState extends State<SplashScreentwo> {
  final int timerDurationMilliseconds = 1200;

  final int navigateDurationMilliseconds = 3000;

  @override
  void initState() {
    super.initState();
    gotoNext();
    CartViewModel.getCartData();
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
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CustomBottomNavigationBarTwo()));
    }
    );
  }
}
