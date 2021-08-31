import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateAndFinish(context,widget)=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>widget), (Route<dynamic> route) => false,);

Future<bool?> makeToast (String mssg) async {
  return  Fluttertoast.showToast(
      msg: mssg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:Colors.grey,
      textColor: Colors.black,
      fontSize: 14.0 );
}