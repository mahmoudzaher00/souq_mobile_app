import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/translations/codegen_loader.g.dart';
import 'package:untitled1/view/screens/SplashScreen.dart';
import 'package:untitled1/view_model/BottomNagvigation_view_model.dart';
import 'package:untitled1/view_model/Login_view_model.dart';
import 'package:untitled1/view_model/Resgister_View_Model.dart';
import 'package:untitled1/view_model/favorite_view_model.dart';
import 'model/remote/Productprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    path: 'assets/translations',
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),

      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ListenableProvider<SignupViewModel>(create: (context) => SignupViewModel()),
          ListenableProvider<LoginViewModel>(create: (context) => LoginViewModel()),
          ListenableProvider<BottomNavigationViewModel>(create: (context) => BottomNavigationViewModel()),
          ListenableProvider<ProductProvider>(create: (context) => ProductProvider()),
          ListenableProvider<FavoriteViewModel>(create: (context) => FavoriteViewModel()),
        ],
        child: MaterialApp(
          supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.lightBlue,
            ),
            home: SplashScreen()));
  }
}
