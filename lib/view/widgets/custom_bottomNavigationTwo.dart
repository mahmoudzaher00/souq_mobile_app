import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/translations/locale_keys.g.dart';
import 'package:untitled1/view/screens/FavoritesScreen.dart';
import 'package:untitled1/view/screens/HomeScreen.dart';
import 'package:untitled1/view/screens/MoreScreen.dart';
import 'package:untitled1/view_model/BottomNagvigation_view_model.dart';
import 'package:untitled1/view_model/favorite_view_model.dart';
import 'MainAppbar.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomBottomNavigationBarTwo extends StatelessWidget {

  List<Widget> _widgetoption = <Widget>[
    HomeScreen(),
    FavoritesScreen(),
    MoreScreen(),
  ];


@override
  Widget build(BuildContext context) {
    final _ref = Provider.of<BottomNavigationViewModel>(context);

       return Scaffold(
        appBar: MainAppBar(),
        body: _widgetoption.elementAt(_ref.selectedIndex),
        bottomNavigationBar: bottomNavigationBar(_ref, context),
      );

    }

    Widget bottomNavigationBar(ref, BuildContext context) {
      final _ref1 = Provider.of<FavoriteViewModel>(context);
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
              // iconSize: 24,
              currentIndex: ref.selectedIndex,
              onTap: (index) {
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
                    icon: Icon(Icons.home),
                    label: '${LocaleKeys.home.tr()}'
                  // title: new Text(LocaleKeys.NBB_text.tr()),
                ),
                BottomNavigationBarItem(
                    icon: Container(
                      //color: Colors.blueGrey,
                      height: 35,
                      width: 50,
                      child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Center(child: Icon(Icons.favorite_border_outlined)),
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red.shade900,
                                    shape: BoxShape.circle
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('${_ref1.FavoritesList.length}',
                                    style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ),

                          ]),
                    ),
                    label: '${LocaleKeys.Favorites.tr()}'
                  // title: new Text(LocaleKeys.NBB_text2.tr()),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz_rounded),
                    label: '${LocaleKeys.more.tr()}'
                  // title: Text(LocaleKeys.NBB_text3.tr())),
                )
              ],
            ),
          ));
    }
}