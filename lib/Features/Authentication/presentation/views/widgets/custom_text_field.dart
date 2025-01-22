import 'package:flutter/material.dart';
import '../../../../../Core/utils/style/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChange;
  final bool isPassword;

  const CustomTextField(
      {required this.hintText,
      this.onChange,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      required this.controller,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
      child: TextFormField(
        onChanged: onChange,
        controller: controller,
        keyboardType: keyboardType,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please enter some information';
          }
          return null;
        },
        onTapOutside: (pointerDownEvent) {
          FocusScope.of(context).unfocus();
        },
        cursorColor: AppColors.primaryColor,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
      ),
    );
  }
}
