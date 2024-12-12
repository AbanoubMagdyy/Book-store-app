import 'package:book_store/Features/Authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../Core/utils/widgets/custom_button.dart';
import '../view_model/auth_cubit/auth_cubit.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: emailController,
            hintText: 'enter your email',
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email,
          ),
          CustomButton(
            onTap: () {
              AuthenticationCubit.get(context)
                  .forgotPasswordMethod(email: emailController.text);
            },
            text: 'Reset now',
          )
        ],
      ),
    );
  }
}
