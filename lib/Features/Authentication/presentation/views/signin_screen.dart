import 'package:book_store/Core/utils/widgets/custom_button.dart';
import 'package:book_store/Features/Authentication/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:book_store/Features/Authentication/presentation/views/reset_password_screen.dart';
import 'package:book_store/Features/Authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../Core/utils/style/colors.dart';
import '../../../../Core/utils/style/text_styles.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            icon: Icons.email,
            hintText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomTextField(
            icon: Icons.password,
            hintText: 'Password',
            isPassword: true,
            controller: passwordController,
          ),
          Align(
            alignment: Alignment.topRight,
            child: MaterialButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: AppColors.secondaryColor,
                  builder: (context) {
                    return const ResetPasswordScreen();
                  },
                );
              },
              child: Text(
                'Forget Your Password ?',
                style: AppTextStyles.textStyle18.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                AuthenticationCubit.get(context).signInMethod(
                    email: emailController.text,
                    password: passwordController.text);
              }
            },
            text: 'Sign in',
          )
        ],
      ),
    );
  }
}
