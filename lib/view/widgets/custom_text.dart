import 'package:flutter/material.dart';

class CustomText extends StatelessWidget{
  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontweight;

  const CustomText({this.text,this.fontSize, this.color, this.fontweight}) ;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(fontSize: fontSize,color: color,fontWeight: fontweight),
    );
  }

}