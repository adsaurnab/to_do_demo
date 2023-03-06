import 'package:flutter/material.dart';

class AppColors{
  static const int _primaryColorValue = 0xFF240DFF; 
  static const MaterialColor colorPrimarySwatch = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFEAE7FF),
      100: Color(0xFFC5BFFF),
      200: Color(0xFFA096FF),
      300: Color(0xFF7F71FF),
      400: Color(0xFF5946FF),
      500: Color(_primaryColorValue),
      600: Color(0xFF2F1DE3),
      700: Color(0xFF2A19CE),
      800: Color(0xFF2313BB),
      900: Color(0xFF1B0C9E),
    },
  );

  static const primaryColor = Color(0xFF20A39E);
  static const secondaryColor = Color(0xFFEF5B5B);
  static const backgroundColor = Color(0xFFE8E8E8);
  static const transparent = Colors.transparent;


  static const orangeColor = Color(0xFFFFBA49);
  static const blueColor = Color(0xFF20A39E);
  static const redColor = Color(0xFFEF5B5B);
  static const purpleColor = Color(0xFF23001E);
  static const greyColor = Color(0xFFA4A9AD);

  static const cardBackgroundColor = Color.fromARGB(255, 255, 236, 236);



}