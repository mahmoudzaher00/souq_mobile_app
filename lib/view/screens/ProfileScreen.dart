import 'package:flutter/material.dart';
import 'package:untitled1/view/shared/Network/local/shared_pref.dart';
import 'package:untitled1/view_model/Profile_view_model.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            CircleAvatar(
             backgroundColor: Colors.black54,
              child: Icon(
               Icons.person,
               color: Colors.white,
            ),
          ),
              Text("${MySharedPreferences.getData(key: "token")}"),
              Text("${ProfileViewModel.profileModel.data.name} "),
            ],
          ),
        ),
      ),
    );
  }

}