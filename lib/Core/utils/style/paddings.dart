import 'package:flutter/widgets.dart';

abstract class AppPaddings {
  static const double screenPaddingValue = 15;
  static const double paddingBetweenWidgetsValue = 20;
  static const EdgeInsetsGeometry screenPadding =
      EdgeInsetsDirectional.all(screenPaddingValue);
  static const EdgeInsetsGeometry paddingBetweenWidgets =
      EdgeInsetsDirectional.symmetric(vertical: paddingBetweenWidgetsValue);
}
