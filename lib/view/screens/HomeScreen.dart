import 'package:flutter/material.dart';
import 'package:untitled1/view/widgets/ImageSlider.dart';
import 'package:untitled1/view/widgets/MainAppbar.dart';
import 'package:untitled1/view/widgets/custom_bottomNavigationBar.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: CarouselImage(context),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar()
    );
  }
}




