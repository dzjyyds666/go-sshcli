import 'package:flutter/material.dart';

class ResponsiveText {
  static double width = 1600;
  static double height = 1000;

  static void initResponsiveText(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  static double getResponsiveFontSize(double fontSize) {
    // 计算响应式字体大小
    double responsiveFontSize = fontSize * (width / height);
    return responsiveFontSize;
  }
}
