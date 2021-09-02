import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/translations/codegen_loader.g.dart';
import 'package:untitled1/view/screens/LoginScreen.dart';
import 'package:untitled1/view/screens/SplashScreen.dart';
import 'package:untitled1/view/shared/Network/local/shared_pref.dart';
import 'package:untitled1/view/shared/Network/remote/Productprovider.dart';
import 'package:untitled1/view/shared/Network/remote/dio_helper.dart';
import 'package:untitled1/view/shared/components/constants.dart';
import 'package:untitled1/view/widgets/custom_bottomNavigationTwo.dart';
import 'package:untitled1/view_model/BottomNagvigation_view_model.dart';
import 'package:untitled1/view_model/Login_view_model.dart';
import 'package:untitled1/view_model/Profile_view_model.dart';
import 'package:untitled1/view_model/Resgister_View_Model.dart';
import 'package:untitled1/view_model/favorite_view_model.dart';
import 'package:untitled1/view_model/slider_images_view_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();




  DioHelper.init();
  await MySharedPreferences.init();

  Widget widget;

  token = MySharedPreferences.getData(key: 'token');


    if (token != null) {
      widget = CustomBottomNavigationBarTwo();
    } else {
      widget = SplashScreen();
    }

  runApp(EasyLocalization(
    path: 'assets/translations',
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),

      child: MyApp(
        startWidget: widget,
      )));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({
    this.startWidget,
  });


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ListenableProvider<SignupViewModel>(create: (context) => SignupViewModel()),
          ListenableProvider<LoginViewModel>(create: (context) => LoginViewModel()),
          ListenableProvider<BottomNavigationViewModel>(create: (context) => BottomNavigationViewModel()),
          ListenableProvider<ProductProvider>(create: (context) => ProductProvider()),
          ListenableProvider<FavoriteViewModel>(create: (context) => FavoriteViewModel()),
          ListenableProvider<SliderImagesViewModel>(create: (context) => SliderImagesViewModel()),
          //ListenableProvider<ProfileViewModel>(create: (context) => ProfileViewModel()),
        ],
        child: MaterialApp(
          supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.lightBlue,
            ),
            home: startWidget));
  }
}
