import 'package:flutter/material.dart';

const int screenWidth = 428;

const int screenHeight = 926;

const double defaultPadding = 16;

const double defaultHeightSpace = 16 / 926;

double getAbsWidth(BuildContext context) {
  return screenWidth/ MediaQuery.sizeOf(context).width;
}
double getAbsHeight(BuildContext context) {
  return screenHeight/ MediaQuery.sizeOf(context).height;
}
