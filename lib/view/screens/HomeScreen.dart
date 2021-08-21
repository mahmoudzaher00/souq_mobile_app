import 'package:flutter/material.dart';
import 'package:untitled1/view/widgets/ImageSlider.dart';
import 'package:untitled1/view/widgets/custom_bottomNavigationBar.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(42, 87, 128, 1),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: CarouselImage(context),
        ),
        bottomNavigationBar: CustomBottomNavigationBar()
    );
  }
}




