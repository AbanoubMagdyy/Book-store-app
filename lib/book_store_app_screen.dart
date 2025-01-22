import 'package:book_store/Features/home/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookStoreApp extends StatelessWidget {
  final Widget screen;

  const BookStoreApp(this.screen, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUserData()..getBooks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Merriweather',
        ),
        home: screen,
      ),
    );
  }
}
