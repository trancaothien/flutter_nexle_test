import 'package:flutter/material.dart';

import 'fonts.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
      height: 1.6);
}

TextStyle getRegularStyle(
    {double fontSize = FontSizes.s12, required Color color}) {
  return _getTextStyle(fontSize, Fonts.fontFamily, FontWeights.regular, color);
}

TextStyle getLightStyle(
    {double fontSize = FontSizes.s12, required Color color}) {
  return _getTextStyle(fontSize, Fonts.fontFamily, FontWeights.light, color);
}

TextStyle getBoldStyle(
    {double fontSize = FontSizes.s12, required Color color}) {
  return _getTextStyle(fontSize, Fonts.fontFamily, FontWeights.bold, color);
}
