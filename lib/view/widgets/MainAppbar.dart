import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/screens/CartScreen.dart';
import 'package:untitled1/view/screens/test22.dart';
import 'package:untitled1/view_model/Cart_View_Model.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;

  MainAppBar() : preferredSize = Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {


    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 35,
            width: 50,
            child: Stack(alignment: Alignment.topRight, children: [
              Center(
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Test22()));
                  },
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red.shade900, shape: BoxShape.circle),
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ]),
          ),
        ),
      ],
      automaticallyImplyLeading: false,
      // shadowColor: Colors.indigo[700],
      elevation: 8,
      centerTitle: true,
      backgroundColor: Color.fromRGBO(42, 87, 128, 1),
      toolbarHeight: 50,
      shape: ContinuousRectangleBorder(
        borderRadius: const BorderRadius.only(
          bottomLeft: const Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
      ),
      // title: CircleAvatar(
      //   radius: 30,
      //   backgroundImage: AssetImage('images/2.png'),
      // ),
    );
  }
}
