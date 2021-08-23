import 'package:flutter/material.dart';

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
            title: Text('بيانات حسابي'),
            subtitle: Text('معلومات شخصية'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
            title: Text('اللغة'),
            subtitle: Text('التحكم في اللغه'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>Language()));
            },
          ),
          Divider(
            height: 1.0,
            indent: 1.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightGreenAccent,
              child: Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
            title: Text('اتصل بنا'),
            subtitle: Text('للتواصل معنا '),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>CallUs()));
            },
          ),
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
            title: Text('الشروط والأحكام'),
            subtitle: Text('قم بمراجعة الشروط والأحكام'),
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
              backgroundColor: Colors.amber,
              child: Icon(
                Icons.info,
                color: Colors.white,
              ),
            ),
            title: Text('حول التطبيق'),
            subtitle: Text('تعرف علينا اكثر'),
            trailing: Icon(Icons.arrow_forward_ios),
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