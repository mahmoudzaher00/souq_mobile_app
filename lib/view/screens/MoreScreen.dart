import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:untitled1/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:untitled1/view/screens/Language.dart';
import 'package:untitled1/view/screens/ProfileScreen.dart';
import 'package:untitled1/view/shared/components/constants.dart';


class MoreScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black54,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            title: Text('${LocaleKeys.my_account.tr()}'),
            subtitle: Text('${LocaleKeys.Personal_Information.tr()}'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));

            },
          ),
          new Divider(
            height: 1.0,
            indent: 1.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent[200],
              child: Icon(
                Icons.language_outlined,
                color: Colors.white,
              ),
            ),
            title: Text('${LocaleKeys.Language.tr()}'),
            subtitle: Text('${LocaleKeys.language_control.tr()}'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguageScreen()));
            },
          ),
          Divider(
            height: 1.0,
            indent: 1.0,
          ),
          // ListTile(
          //   leading: CircleAvatar(
          //     backgroundColor: Colors.lightGreenAccent,
          //     child: Icon(
          //       Icons.phone,
          //       color: Colors.white,
          //     ),
          //   ),
          //   title: Text('Call Us'),
          //   subtitle: Text('To Contact Us'),
          //   trailing: Icon(Icons.arrow_forward_ios),
          //   onTap: (){
          //   //  Navigator.push(context, MaterialPageRoute(builder: (context)=>CallUs()));
          //   },
          // ),
          new Divider(
            height: 1.0,
            indent: 1.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              child: Icon(
                Icons.assignment,
                color: Colors.white,
              ),
            ),
            title: Text('${LocaleKeys.Terms_and_Conditions.tr()}'),
            subtitle: Text('${LocaleKeys.Review_conditions.tr()}'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>screen3()));
            },
          ),
          new Divider(
            height: 1.0,
            indent: 1.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
            title: Text('${LocaleKeys.logout.tr()}'),
            //subtitle: Text('${LocaleKeys.Get_more.tr()}'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              signOut(context);
            },
          ),
          new Divider(
            height: 1.0,
            indent: 1.0,
          ),
        ],
      ),
    );
  }
}