import 'package:flutter/material.dart';

import '../../../../../Core/utils/style/colors.dart';

class InfoItemWidget extends StatelessWidget {
  final String text;

  const InfoItemWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
        end: 10,
        top: 10,
      ),
      padding: const EdgeInsetsDirectional.all(
        8,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(
          .5,
        ),
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Center(
        child: Text(
          text,
        ),
      ),
    );
  }
}
