import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/view/widgets/CategoriesWidget.dart';
import 'package:untitled1/view/widgets/ImageSlider.dart';
import 'package:untitled1/view/widgets/MainAppbar.dart';
import 'package:untitled1/view/widgets/ProductsWidget.dart';
import 'package:untitled1/view/widgets/custom_bottomNavigationBar.dart';
import 'package:untitled1/view/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final statusBar = MediaQuery.of(context).padding.top;
    final appBar = AppBar().preferredSize.height;
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - statusBar -appBar - 65 ,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: CarouselImage(context),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: CustomText(text:'Categories',fontweight: FontWeight.bold,fontSize: 20,),
                ),
                CategoriesWidget(),
                Divider(thickness: 3,),
               Padding(
                padding: const EdgeInsets.only(left:8.0,bottom: 12),
                child: CustomText(text:'Recommended For You',fontweight: FontWeight.bold,fontSize: 20,)),
                 ProductsWidget(),
              ],
             ),
            ]),
        ),
      ),
    );
  }
}
