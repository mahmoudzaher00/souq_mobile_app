import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget{
  final Size preferredSize;
  MainAppBar() : preferredSize = Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color:Colors.white,
      ),
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.notifications_outlined,color:Colors.blueAccent[900],),
      //     onPressed: (){},
      //   )
      // ],
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