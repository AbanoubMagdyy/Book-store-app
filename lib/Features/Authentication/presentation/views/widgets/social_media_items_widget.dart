import 'package:flutter/material.dart';
import '../../../../../Core/utils/assets.dart';
import 'custom_circle_avatar_widget.dart';

class SocialMediaItemsWidget extends StatelessWidget {
  const SocialMediaItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCircleAvatarWidget(
          Assets.facebook,
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 15,
          ),
          child: CustomCircleAvatarWidget(
            Assets.google,
          ),
        ),
        CustomCircleAvatarWidget(
          Assets.twitter,
        ),
      ],
    );
  }
}
