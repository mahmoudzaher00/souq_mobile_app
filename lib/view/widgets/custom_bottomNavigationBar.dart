import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/screens/HomeScreen.dart';
import 'package:untitled1/view/screens/SettingScreen.dart';
import 'package:untitled1/view/screens/FavoritesScreen.dart';
import 'package:untitled1/view_model/BottomNagvigation_view_model.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  List<Widget> _widgetoption = <Widget>[
    HomeScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final _ref=Provider.of<BottomNavigationViewModel>(context);
    return Scaffold(
      body: _widgetoption.elementAt(_ref.selectedIndex),
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        backgroundColor: Color.fromRGBO(42, 87, 128, 1),
        items: [
          TabItem(
            title: 'Home',
            icon: Icon(
              Icons.home_sharp,
              color: Colors.white,
            ),
          ),
          TabItem(
            title: 'Favorites',
            icon: Icon(Icons.star, color: Colors.white),
          ),
          TabItem(
            title: 'More',
            icon: Icon(Icons.more_horiz_rounded, color: Colors.white),
          )
        ],
        initialActiveIndex: _ref.selectedIndex,
        activeColor: Colors.blueGrey.shade600,
       onTap: (index){
          _ref.onItemTapped(index);
       },
      ),
    );
  }
}
