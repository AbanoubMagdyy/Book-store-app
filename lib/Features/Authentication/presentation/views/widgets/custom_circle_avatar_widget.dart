import 'package:book_store/Core/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/style/colors.dart';

class CustomCircleAvatarWidget extends StatelessWidget {
  final String image;
  const CustomCircleAvatarWidget(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
      child: CircleAvatar(
        radius: context.widthPercentage(15),
        backgroundColor: AppColors.primaryColor,
        child: Image.asset(
          image,
          width: context.widthPercentage(25),
        ),
      ),
    );
  }
}
