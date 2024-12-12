import 'package:flutter/material.dart';

import '../../../../../Core/utils/style/colors.dart';
import '../../../../../Core/utils/style/text_styles.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 20,
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 1,
            color: AppColors.primaryColor,
          )),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'OR',
              style: AppTextStyles.textStyle20Bold,
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
