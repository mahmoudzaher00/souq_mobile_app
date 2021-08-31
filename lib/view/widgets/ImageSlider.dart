import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/view/widgets/Cardimage.dart';


List _images = [
  CustomCardImage(image: "images/slideshow/3.jpg",),
  CustomCardImage(image: "images/slideshow/2.jpg",),
  CustomCardImage(image: "images/slideshow/3.jpg",),
  CustomCardImage(image: "images/slideshow/6.png",),
  CustomCardImage(image: "images/slideshow/4.jpg",),
  CustomCardImage(image: "images/slideshow/1.jpg",),
  CustomCardImage(image: "images/slideshow/5.jpg",),
  CustomCardImage(image: "images/slideshow/7.jpg",),
  CustomCardImage(image: "images/slideshow/8.jpg",),
];

Widget CarouselImage(BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Carousel(
        borderRadius: true,
        autoplay: true,
        showIndicator: true,
        animationDuration: Duration(seconds: 2),
        autoplayDuration: Duration(seconds: 4),
        animationCurve: Curves.easeInOutCubic,
        boxFit: BoxFit.fill,
        dotColor: Colors.black45,
        dotIncreasedColor: Colors.black,
        dotBgColor: Color.fromARGB(0, 0, 0, 0),
        dotSize: 5,
        images: _images,
      ));
}
