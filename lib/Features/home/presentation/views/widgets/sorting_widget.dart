import 'package:book_store/Features/home/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:book_store/Features/home/presentation/view_model/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utils/style/colors.dart';

class FilterChipWidget extends StatelessWidget {
  const FilterChipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: cubit.chips.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => FilterChip(
            label: Text(
              cubit.chips[index].name,
              style: TextStyle(
                color: cubit.chips[index].isSelected
                    ? AppColors.primaryColor
                    : AppColors.thirdColor,
              ),
            ),
            showCheckmark: false,
            backgroundColor: AppColors.secondaryColor.withOpacity(.5),
            selectedColor: AppColors.primaryColor,
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            side: BorderSide(
              color: cubit.chips[index].isSelected
                  ? AppColors.primaryColor
                  : AppColors.fourthColor,
            ),
            selected: cubit.chips[index].isSelected,
            onSelected: (bool selected) {
              cubit.selectChip(index);
              cubit.theListIWantMethod(
                cubit.chips[index].name,
              );
            },
          ),
        );
      },
    );
  }
}
