import 'package:flutter/material.dart';
class AppColors {
  static const Color primary = Color(0xff4CAF50);
  static const Color greyDark = Color(0xff7B7B7B);
  static const Color grey = Color(0xffB9B9B9);
  static const Color scaffoldBackgroundColor = Color(0xffFFFCF4);
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color blue = Colors.blue;
  static const Color black = Colors.black;
  static const Color yellow = Color(0xffFFF8E1);
  static const Color transparent = Colors.transparent;

  // Define a custom MaterialColor
  static MaterialColor primarySwatch = MaterialColor(
    0xff4CAF50, // Base color
    {
      50: Color(0xffE8F5E9),
      100: Color(0xffC8E6C9),
      200: Color(0xffA5D6A7),
      300: Color(0xff81C784),
      400: Color(0xff66BB6A),
      500: Color(0xff4CAF50), // Primary
      600: Color(0xff43A047),
      700: Color(0xff388E3C),
      800: Color(0xff2E7D32),
      900: Color(0xff1B5E20),
    },
  );
}
