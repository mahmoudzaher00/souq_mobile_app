import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/screens/FavoritesScreen.dart';
import 'package:untitled1/view/screens/HomeScreen.dart';
import 'package:untitled1/view/screens/MoreScreen.dart';
import 'package:untitled1/view_model/BottomNagvigation_view_model.dart';

import 'MainAppbar.dart';

class CustomBottomNavigationBarTwo extends StatelessWidget {


  List<Widget> _widgetoption = <Widget>[
    HomeScreen(),
    FavoritesScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    final _ref=Provider.of<BottomNavigationViewModel>(context);
    return Scaffold(
      appBar: MainAppBar(),
      body: _widgetoption.elementAt(_ref.selectedIndex),
      bottomNavigationBar: bottomNavigationBar(_ref),
    );
  }

  Widget  bottomNavigationBar(ref) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 6),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Color.fromRGBO(42, 87, 128, 1),
            currentIndex:  ref.selectedIndex,
            onTap: (index){
              ref.onItemTapped(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 13,
            unselectedFontSize: 12,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.blueGrey.shade900,
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
               label: 'Home'
               // title: new Text(LocaleKeys.NBB_text.tr()),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.favorite_border_outlined),
               label: 'Favorites'
               // title: new Text(LocaleKeys.NBB_text2.tr()),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_rounded),
                 label: 'More'
                 // title: Text(LocaleKeys.NBB_text3.tr())),
              )],
          ),
        ));
  }
}