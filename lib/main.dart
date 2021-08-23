import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/screens/SplashScreen.dart';
import 'package:untitled1/view_model/BottomNagvigation_view_model.dart';
import 'package:untitled1/view_model/Login_view_model.dart';
import 'package:untitled1/view_model/Resgister_View_Model.dart';
import 'package:untitled1/view_model/favorite_view_model.dart';

import 'model/remote/Productprovider.dart';



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
          ListenableProvider<BottomNavigationViewModel>(create: (context) => BottomNavigationViewModel()),
          ListenableProvider<ProductProvider>(create: (context) => ProductProvider()),
          ListenableProvider<FavoriteViewModel>(create: (context) => FavoriteViewModel()),

    ],
     child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
         ),
      home: SplashScreen()));
  }
}

