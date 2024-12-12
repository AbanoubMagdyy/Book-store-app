import 'package:book_store/Features/Authentication/presentation/views/authentication_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/auth_cubit/auth_cubit.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => AuthenticationCubit(),
        child: const SafeArea(
          child: AuthenticationScreenBody(),
        ),
      ),
    );
  }
}
