import 'package:book_store/Core/utils/functions/navigation.dart';
import 'package:book_store/Features/home/presentation/view_model/app_cubit/app_states.dart';
import 'package:book_store/Features/home/presentation/views/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utils/assets.dart';
import '../../../../../Core/utils/style/colors.dart';
import '../../../../../Core/utils/style/text_styles.dart';
import '../../view_model/app_cubit/app_cubit.dart';

class AppBarHomeItemWidget extends StatelessWidget {
  const AppBarHomeItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.book,
          width: 120,
        ),
        Expanded(
          child: BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              return RichText(
                text: TextSpan(
                  text: 'Hello ',
                  style:
                      AppTextStyles.textStyle18.copyWith(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${AppCubit.get(context).userModel?.name ?? ''},\n'
                          .toUpperCase(),
                      style: AppTextStyles.textStyle24Bold,
                    ),
                    const TextSpan(text: 'What do you want to read today?!'),
                  ],
                ),
              );
            },
          ),
        ),
        InkWell(
          onTap: () => navigateTo(
            context,
            CartScreen(AppCubit.get(context).cart),
          ),
          child: const Icon(
            Icons.shopping_cart,
            color: AppColors.primaryColor,
            size: 35,
          ),
        ),
      ],
    );
  }
}
