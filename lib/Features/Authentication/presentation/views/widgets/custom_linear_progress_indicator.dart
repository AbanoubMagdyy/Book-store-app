import 'package:flutter/material.dart';

import '../../../../../Core/utils/style/colors.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: AppColors.primaryColor,
      backgroundColor: Colors.grey,
      minHeight: 10,
      borderRadius: BorderRadiusDirectional.circular(25),
    );
  }
}
