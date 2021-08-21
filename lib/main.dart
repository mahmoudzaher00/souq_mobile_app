import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/screens/SplashScreen.dart';
import 'package:untitled1/view_model/Login_view_model.dart';
import 'package:untitled1/view_model/Resgister_View_Model.dart';



void main() {
runApp (

        MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ListenableProvider<SignupViewModel>(create: (context) => SignupViewModel()),
          ListenableProvider<LoginViewModel>(create: (context) => LoginViewModel()),

    ],
     child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  color: Color.fromRGBO(42, 87, 128 ,1),
                  fontWeight: FontWeight.bold))),
      home: SplashScreen()));
  }
}

