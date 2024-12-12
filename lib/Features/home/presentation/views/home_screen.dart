import 'package:book_store/Features/home/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:book_store/Features/home/presentation/views/widgets/app_bar_home_item_widget.dart';
import 'package:book_store/Features/home/presentation/views/widgets/best_seller_item_widget.dart';
import 'package:book_store/Features/home/presentation/views/widgets/book_item_widget.dart';
import 'package:book_store/Features/home/presentation/views/widgets/popular_item_widget.dart';
import 'package:book_store/Features/home/presentation/views/widgets/title_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../view_model/app_cubit/app_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBarHomeItemWidget(),
        Expanded(
          child: SingleChildScrollView(
            child: BlocBuilder<AppCubit, AppStates>(
              builder: (context, state) {
                var cubit = AppCubit.get(context);
                return Skeletonizer(
                  enabled: cubit.books.isEmpty,
                  child: Column(
                    children: [
                      if (cubit.books.isNotEmpty)
                        BestSellerItemWidget(
                          cubit.books[0],
                        ),
                      const TitleItemWidget('Popular'),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.popularBooks.length,
                          itemBuilder: (context, index) => PopularItemWidget(
                            cubit.popularBooks[index],
                          ),
                        ),
                      ),
                      const TitleItemWidget('New Books'),
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.books.length,
                        itemBuilder: (context, index) => BookItemWidget(
                          cubit.books[index],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
