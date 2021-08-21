import 'package:flutter/material.dart';

class CustomCardImage extends StatelessWidget {
  final String image;

  CustomCardImage({this.image});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),

      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        child: Image.asset(image,height: 142,width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
