import 'package:flutter/material.dart';

class AppSize {
  AppSize._();
  static const _figmaHeight = 800;
  static const _figmaWidth = 360;

  static double height(BuildContext context, double value) {
    double height = MediaQuery.of(context).size.longestSide;
    return value * (height / _figmaHeight);
  }

  static double width(BuildContext context, double value) {
    double width = MediaQuery.of(context).size.shortestSide;
    return value * (width / _figmaWidth);
  }
}
