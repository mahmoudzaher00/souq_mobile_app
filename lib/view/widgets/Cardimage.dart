import 'package:flutter/material.dart';

class CustomCardImage extends StatelessWidget {
  final String image;
  CustomCardImage({this.image});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Color.fromRGBO(42, 87, 128, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        child: Image.asset(image,
         width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
