import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/widgets/Cardimage.dart';
import 'package:untitled1/view_model/slider_images_view_model.dart';

List _images = [
  "images/slideshow/3.jpg",
  "images/slideshow/2.jpg",
  "images/slideshow/6.png",
  "images/slideshow/4.jpg",
  "images/slideshow/1.jpg",
  "images/slideshow/5.jpg",
  "images/slideshow/7.jpg",
  "images/slideshow/8.jpg",
];

final CarouselController _controller = CarouselController();

Widget CarouselImage(BuildContext context) {
  final _ref = Provider.of<SliderImagesViewModel>(context);

  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    child: Stack(children: [
      CarouselSlider(
          items: _images.map((item) {
            return CustomCardImage(
              image: item,
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
              height: double.infinity,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              reverse: false,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 2),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              viewportFraction: 1.0,
              onPageChanged: (int index, _) {
                _ref.currentIndex = index;
              })),
      Positioned(
        bottom: MediaQuery.of(context).size.height*.01,
        left: MediaQuery.of(context).size.width*0.3,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: _images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_ref.currentIndex == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ),
    ]),


  );
}

Container buildContainer(int index, ref) {
  return Container(
    width: 10,
    height: 10,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: ref.currentIndex == index ? Colors.black : Colors.grey,
    ),
  );
}
