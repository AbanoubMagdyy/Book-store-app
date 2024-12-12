import 'package:flutter/material.dart';

import '../../../../../Core/utils/style/colors.dart';

class CustomCircleAvatarWidget extends StatelessWidget {
  final String image;

  const CustomCircleAvatarWidget(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: AppColors.primaryColor,
      child: Image.asset(
        image,
        width: 35,
      ),
    );
  }
}
