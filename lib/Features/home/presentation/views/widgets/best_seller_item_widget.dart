import 'package:book_store/Features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:book_store/Core/utils/functions/cache_image_function.dart';
import 'package:book_store/Core/utils/style/colors.dart';
import 'package:book_store/Core/utils/style/text_styles.dart';

class BestSellerItemWidget extends StatelessWidget {
  final BookModel bookModel;
  const BestSellerItemWidget(this.bookModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsetsDirectional.all(25),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadiusDirectional.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.6),
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          /// text
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Best seller of the week',
                  style: AppTextStyles.textStyle20Bold
                      .copyWith(color: AppColors.secondaryColor),
                ),
                Text(
                  bookModel.title,
                  style: AppTextStyles.textStyle24Bold
                      .copyWith(color: AppColors.secondaryColor),
                ),
                InkWell(
                  //    onTap: ()=>bottomSheet(context,cubit.drinkWithMaxNumberOfSold()),
                  child: Row(
                    children: const [
                      Text(
                        'More info',
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          /// image
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20)),
            child: cachedImage(
              imageUrl: bookModel.imageUrl,
            ),
          )
        ],
      ),
    );
  }
}
