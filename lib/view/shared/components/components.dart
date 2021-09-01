import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void navigateAndFinish(context , widget) {
  Navigator.pushAndRemoveUntil
    (context, MaterialPageRoute(builder: (context)=> widget), (Route<dynamic> route) => false,);
}

Future<bool> makeToast (String mssg) async {
  return  Fluttertoast.showToast(
      msg: mssg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:Colors.grey,
      textColor: Colors.black,
      fontSize: 14.0 );
}

 Future<bool> checkInternetConnectivity() async {
    final ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
    // print('Mobile');
    return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
    // print('Wifi');
    return true;
    } else if (connectivityResult == ConnectivityResult.none) {
    print('No Connection');
    return false;
    } else {
    return false;
    }
}