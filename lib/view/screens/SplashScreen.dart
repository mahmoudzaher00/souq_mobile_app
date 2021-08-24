import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/view/widgets/custom_bottomNavigationTwo.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int timerDurationMilliseconds = 1200;

  final int navigateDurationMilliseconds = 3000;

  @override
  void initState() {
    super.initState();
    gotoNext();
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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen()));
    });
  }
}
