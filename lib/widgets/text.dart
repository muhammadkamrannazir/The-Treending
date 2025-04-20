import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  double? fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final FontStyle? fontStyle;
  final double height;
  final Color? backgroundColor;
  final TextDecoration? decoration;

  CustomText(
    this.text, {
    super.key,
    this.maxLines,
    this.color = Colors.black,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.fontStyle = FontStyle.normal,
    this.height = 1,
    this.backgroundColor,
    this.decoration,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      // textDirection: TextDirection.ltr,
      style: TextStyle(
        height: height,
        color: color,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight,
        // fontFamily: 'Noto Nastaliq Urdu',
        overflow: overflow,
        fontStyle: fontStyle,
        wordSpacing: 0,
        letterSpacing: 1.1,
        backgroundColor: backgroundColor,
        decoration: decoration,
        decorationColor: Colors.red,
        // fontFamily: 'PoetsenOne-Regular',
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}