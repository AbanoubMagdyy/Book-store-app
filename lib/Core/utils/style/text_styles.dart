import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTextStyles {
  static TextStyle textStyle20Bold = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryColor);
  static TextStyle textStyle24Bold = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryColor);
  static TextStyle textStyle18 =
      const TextStyle(fontSize: 18, color: AppColors.secondaryColor);
}
