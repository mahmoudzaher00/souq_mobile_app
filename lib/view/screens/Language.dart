import 'package:flutter/material.dart';
import 'package:untitled1/view/widgets/MainAppbar.dart';
import 'package:easy_localization/easy_localization.dart';



class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
        body: Container(
      child: Center(
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () async{
              await context.setLocale( Locale('en'),);
            }, child: Text('English')),
            ElevatedButton(onPressed: () async{
              await context.setLocale(Locale('ar'),);
            }, child: Text('العربية')),
          ],
        ),
      ),
    ));
  }
}
