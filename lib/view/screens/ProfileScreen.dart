import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/model/Login.dart';
import 'package:untitled1/view/shared/Network/local/shared_pref.dart';
import 'package:untitled1/view_model/Login_view_model.dart';
import 'package:untitled1/view_model/Resgister_View_Model.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SignupViewModel>(context);
    final _model = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: Container(
        child: Center(

          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${MySharedPreferences.getData(key: "token")}"),
              Text("${_model.profileModel.data.name} "),
            ],
          ),
        ),
      ),
    );
  }

}