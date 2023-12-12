import 'package:flutter/material.dart';

class AppSizeText {
  // Define static properties for commonly used text sizes
  static const double smallTextSize = 14.0;
  static const double mediumTextSize = 16.0;
  static const double largeTextSize = 20.0;

  // Example method to get a TextStyle with a specific text size
  static TextStyle getSmallTextStyle({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: smallTextSize,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle getMediumTextStyle({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: mediumTextSize,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle getLargeTextStyle({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: largeTextSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
