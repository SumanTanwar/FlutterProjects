import 'package:flutter/material.dart';

class AppStyle{
  static const double smallFontSize = 12.0;
  static const double mediumFontSize = 16.0;
  static const  double largeFontSize = 24.0;

  static const FontWeight boldWeight = FontWeight.bold;

  Color whiteText  = Colors.white;
  Color blueGreyBg = Colors.blueGrey;

  static TextStyle getTextStyle ({
    double fontSize = largeFontSize,
    FontWeight bold = boldWeight
  }){
    return TextStyle(
      fontSize: fontSize,
      fontWeight: bold
    );
  }
}