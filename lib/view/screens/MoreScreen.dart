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
            title: Text('My Account'),
            subtitle: Text('Personal Information'),
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
            title: Text('Language'),
            subtitle: Text('language control'),
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
            title: Text('Call Us'),
            subtitle: Text('To Contact Us'),
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
            title: Text('Terms and Conditions'),
            subtitle: Text('Review the terms and conditions'),
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
            title: Text('About the app'),
            subtitle: Text('Get to know us more'),
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