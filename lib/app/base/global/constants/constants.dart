import 'package:flutter/material.dart';

import 'app_colors.dart';

const mainPadding = 20.0;
const appFontSize = fontSizeNormal;

const double fontSizeLarge = 18;
const double fontSizeNormal = 16;
const double fontSizeSmall = 14;

EdgeInsets p({double left = 0.0, double right = 0.0, double top = 0.0, double bottom = 0.0}) => EdgeInsets.only(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    );

const EdgeInsets p8 = EdgeInsets.all(8);
const EdgeInsets p20 = EdgeInsets.all(20);
const EdgeInsets pSymH20 = EdgeInsets.symmetric(horizontal: 20);
const EdgeInsets pSymH10 = EdgeInsets.symmetric(horizontal: 10);
EdgeInsets pSymH(double horizontal) => EdgeInsets.symmetric(horizontal: horizontal);
const EdgeInsets pSymV20 = EdgeInsets.symmetric(vertical: 20);
EdgeInsets pSymV(double vertical) => EdgeInsets.symmetric(vertical: vertical);

Widget sbH(height) {
  return SizedBox(
    height: double.parse(height.toString()),
  );
}

Widget sbW(width) {
  return SizedBox(
    width: double.parse(width.toString()),
  );
}

Widget sbH10() {
  return const SizedBox(
    height: 10,
  );
}

Widget sbW10() {
  return const SizedBox(
    width: 10,
  );
}

Widget sbH20() {
  return const SizedBox(
    height: 20,
  );
}

Widget sbW20() {
  return const SizedBox(
    width: 20,
  );
}

TextStyle textAppBar({bool isWhiteColor = false}) {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: isWhiteColor ? Colors.white: AppColors.primaryColor,
  );
}
