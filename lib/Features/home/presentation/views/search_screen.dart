import 'package:book_store/Features/home/presentation/views/widgets/book_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/app_cubit/app_cubit.dart';
import '../view_model/app_cubit/app_states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: cubit.searchResult.length,
            itemBuilder: (context, index) => BookItemWidget(
              cubit.searchResult[index],
            ),
          );
        },
      ),
    );
  }
}
