import 'package:book_store/Core/utils/style/paddings.dart';
import 'package:book_store/Features/home/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/style/colors.dart';
import '../view_model/app_cubit/app_states.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            onTap: (index) => cubit.changeCurrentIndex(index),
            currentIndex: cubit.currentIndex,
            selectedItemColor: AppColors.primaryColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: AppColors.thirdColor,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_books,
                  color: AppColors.thirdColor,
                ),
                label: 'Library',
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: AppPaddings.screenPadding,
              child: cubit.screens[cubit.currentIndex],
            ),
          ),
        );
      },
    );
  }
}
