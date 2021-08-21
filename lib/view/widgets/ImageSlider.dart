import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/view/widgets/Cardimage.dart';




List images =[
  CustomCardImage(image :"assets/images/1.jpg"),
  CustomCardImage(image :"assets/images/2.jpg"),
  CustomCardImage(image :"assets/images/3.jpg"),
  CustomCardImage(image :"assets/images/4.jpg"),
];

Widget CarouselImage(BuildContext context){

  return Container(
    height: MediaQuery.of(context).size.height*0.33,
    child: Carousel(
        borderRadius: true,
        autoplay: true,
        showIndicator: true,
        animationDuration: Duration(seconds: 2),
        autoplayDuration:Duration(seconds: 4),
        animationCurve: Curves.easeInOutCubic,
        boxFit: BoxFit.fill,
        dotColor : Colors.orange,
        dotIncreasedColor:Colors.black45,
        dotBgColor: Color.fromARGB(0, 0, 0, 0),
        dotSize: 5,
        images: images

    ),
  );


}