import 'package:book_store/Core/utils/assets.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double width;
  const LogoWidget({required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.book,
      width: width,
    );
  }
}
