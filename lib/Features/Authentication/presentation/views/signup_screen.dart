import 'package:book_store/Features/Authentication/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:book_store/Features/Authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../Core/utils/widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
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
            icon: Icons.person,
            hintText: 'Name',
            controller: nameController,
          ),
          CustomTextField(
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email',
            controller: emailController,
          ),
          CustomTextField(
            icon: Icons.password,
            hintText: 'Password',
            controller: passwordController,
            isPassword: true,
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                AuthenticationCubit.get(context).signUpMethod(
                    email: emailController.text,
                    password: passwordController.text);
              }
            },
            text: 'Sign up',
          )
        ],
      ),
    );
  }
}
