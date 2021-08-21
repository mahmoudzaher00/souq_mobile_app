import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/view/screens/CategoriesScreen.dart';
import 'package:untitled1/view/screens/FavoritesScreen.dart';
import 'package:untitled1/view/screens/ProfileScreen.dart';

class CustomBottomNavigationBar extends StatefulWidget {


  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex=0;
  void _incrementCounter() {
    setState(() {
      _selectedIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    return ConvexAppBar(
        items: [
          TabItem(
            title: 'Explore',

            icon: Icon(Icons.explore),),
          TabItem(
            title: 'Cart',
            icon: Icon(Icons.shopping_cart_outlined),),

          TabItem(
            title: 'Profile',
            icon: Icon(Icons.person_pin),)


        ],
        initialActiveIndex: _selectedIndex,

        backgroundColor: Colors.grey[500],
        activeColor: Colors.white,
// selectedItemColor: Colors.teal[800],
//  unselectedItemColor: Colors.grey[900],

        onTap:_onItemTapped,


      );
  }
}
