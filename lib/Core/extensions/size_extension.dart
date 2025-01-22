import 'package:flutter/widgets.dart';

extension SizeExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double widthPercentage(double percentage) => screenWidth / percentage;
  double heightPercentage(double percentage) => screenHeight / percentage;
}
