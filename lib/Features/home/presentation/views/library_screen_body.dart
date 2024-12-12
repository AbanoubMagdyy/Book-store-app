import 'package:book_store/Features/home/presentation/views/widgets/book_item_widget.dart';
import 'package:book_store/Features/home/presentation/views/widgets/sorting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utils/style/paddings.dart';
import '../../../../Core/utils/widgets/toggle_switch_widget.dart';
import '../view_model/app_cubit/app_cubit.dart';
import '../view_model/app_cubit/app_states.dart';

class LibraryScreenBody extends StatelessWidget {
  const LibraryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ToggleSwitchWidget(
            labels: const ['Category', 'Library'],
            onChange: (index) {
              AppCubit.get(context).changeSlider(index ?? 0);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 100,
            child: Padding(
              padding: AppPaddings.paddingBetweenWidgets,
              child: FilterChipWidget(),
            ),
          ),
          Expanded(
            child: BlocBuilder<AppCubit, AppStates>(
              builder: (context, state) {
                var cubit = AppCubit.get(context);

                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: cubit.theListIWant.length,
                  itemBuilder: (context, index) => BookItemWidget(
                    cubit.theListIWant[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
