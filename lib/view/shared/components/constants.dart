import 'package:untitled1/view/screens/LoginScreen.dart';
import 'package:untitled1/view/shared/Network/local/shared_pref.dart';

import 'components.dart';

void signOutFun(context){
  MySharedPreferences.clearDataFromSharedPreference(key: 'token')
      .then((value) {
    if(value)
      navigateAndFinish(context, LoginScreen());
  });
}

String? token = ' ';