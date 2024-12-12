import 'package:book_store/Core/utils/style/colors.dart';
import 'package:book_store/Features/Authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:book_store/Features/home/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:book_store/Features/home/presentation/views/library_screen_body.dart';
import 'package:book_store/Features/home/presentation/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utils/assets.dart';
import '../view_model/app_cubit/app_states.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late TextEditingController search;

  @override
  void initState() {
    search = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              Assets.book,
              width: 120,
            ),
            BlocBuilder<AppCubit, AppStates>(
              builder: (context, state) {
                var cubit = AppCubit.get(context);
                return Visibility(
                  visible: cubit.search,
                  replacement: Expanded(
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            AppCubit.get(context).activeSearch();
                          },
                          icon: const Icon(
                            Icons.search_rounded,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                              onChange: (value) {
                                AppCubit.get(context).findTheBook(value);
                              },
                              hintText: 'what are you looking for?',
                              controller: search,
                              icon: Icons.search),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            onPressed: () {
                              search.clear();
                              AppCubit.get(context).deactivatedSearch();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
        BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Visibility(
              visible: cubit.search,
              replacement: const LibraryScreenBody(),
              child: const SearchScreen(),
            );
          },
        )
      ],
    );
  }
}
