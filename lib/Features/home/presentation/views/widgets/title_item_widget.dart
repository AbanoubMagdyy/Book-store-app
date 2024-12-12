import 'package:flutter/material.dart';

import '../../../../../Core/utils/style/colors.dart';
import '../../../../../Core/utils/style/paddings.dart';
import '../../../../../Core/utils/style/text_styles.dart';

class TitleItemWidget extends StatelessWidget {
  final String title;
  const TitleItemWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.paddingBetweenWidgets,
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.textStyle24Bold
                .copyWith(color: AppColors.thirdColor),
          ),
          const Spacer(),
          Text(
            'More',
            style: AppTextStyles.textStyle18
                .copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
