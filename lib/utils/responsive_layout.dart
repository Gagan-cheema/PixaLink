import 'package:flutter/material.dart';

class ColumnCalculator {
  static int calculateColumns(BuildContext context, double itemWidth) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth / itemWidth).floor();
  }
}
