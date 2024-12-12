import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../style/text_styles.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  const CustomButton(
      {required this.onTap,
      this.buttonColor = AppColors.primaryColor,
      this.textColor = AppColors.secondaryColor,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(vertical: 15),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.textStyle18.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
