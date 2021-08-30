import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
//import 'package:toast/toast.dart';
import 'package:untitled1/translations/locale_keys.g.dart';
import 'package:untitled1/view/widgets/custom_bottomNavigationTwo.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${LocaleKeys.SelectLanguage.tr()}',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(42, 87, 128, 1),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomBottomNavigationBarTwo()));
            },
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  width: double.infinity,
                  child: InkWell(
                    child: Center(
                        child: Text(
                      'English',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                    onTap: () async {
                     // Toast.show('${LocaleKeys.Languagechanged.tr()}', context);
                      await context.setLocale(
                        Locale('en'),

                      );
                    },
                  ),
                ),
              ),
              Divider(
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  child: InkWell(
                    child: Center(
                        child: Text('العربية',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold))),
                    onTap: () async {
                     // Toast.show('${LocaleKeys.Languagechanged.tr()}', context);
                      await context.setLocale(
                        Locale('ar'),
                      );
                    },
                  ),
                ),
              ),
              Divider(
                thickness: 3,
              )
            ],
          ),
        ));
  }
}
