import 'package:book_store/Core/utils/functions/navigation.dart';
import 'package:book_store/Core/utils/shared_preferences.dart';
import 'package:book_store/Features/Authentication/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:book_store/Features/Authentication/presentation/views/signin_screen.dart';
import 'package:book_store/Features/Authentication/presentation/views/signup_screen.dart';
import 'package:book_store/Features/Authentication/presentation/views/widgets/custom_linear_progress_indicator.dart';
import 'package:book_store/Features/Authentication/presentation/views/widgets/or_widget.dart';
import 'package:book_store/Features/Authentication/presentation/views/widgets/social_media_items_widget.dart';
import 'package:book_store/Core/utils/widgets/toggle_switch_widget.dart';
import 'package:book_store/Features/home/presentation/views/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utils/assets.dart';
import '../../../../Core/utils/style/paddings.dart';
import '../view_model/auth_cubit/auth_states.dart';

class AuthenticationScreenBody extends StatelessWidget {
  const AuthenticationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.screenPadding,
      child: Column(
        children: [
          BlocConsumer<AuthenticationCubit, AuthenticationStates>(
            listener: (context, state) {
              if (state is SuccessSignIn || state is SuccessSignUp) {
                Shared.saveDate(key: 'isFirstTime', value: false);
                navigateAndFinish(context, const AppLayout());
              }
            },
            builder: (context, state) {
              return Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.book,
                      width: double.infinity,
                    ),
                    if (state is LoadingSignIn || state is LoadingSignUp)
                      const CustomLinearProgressIndicator(),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ToggleSwitchWidget(
                    labels: const ['Sign up', 'Sign in'],
                    onChange: (index) {
                      AuthenticationCubit.get(context).changeSlider(index ?? 0);
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  BlocBuilder<AuthenticationCubit, AuthenticationStates>(
                    builder: (context, state) {
                      var cubit = AuthenticationCubit.get(context);
                      return Visibility(
                        visible: cubit.currentScreen != 1,
                        replacement: const SigninScreen(),
                        child: const SignupScreen(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const OrWidget(),
                  const SocialMediaItemsWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}