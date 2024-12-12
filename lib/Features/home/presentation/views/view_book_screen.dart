import 'package:book_store/Core/utils/style/paddings.dart';
import 'package:book_store/Core/utils/widgets/custom_button.dart';
import 'package:book_store/Features/home/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:book_store/Features/home/presentation/views/widgets/info_item_widget.dart';
import 'package:flutter/material.dart';
import '../../../../Core/utils/functions/cache_image_function.dart';
import '../../../../Core/utils/style/colors.dart';
import '../../../../Core/utils/style/text_styles.dart';
import '../../data/models/book_model.dart';

class ViewBookScreen extends StatelessWidget {
  final BookModel bookModel;
  const ViewBookScreen(this.bookModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsetsDirectional.only(end: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: cachedImage(
                    imageUrl: bookModel.imageUrl,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    bookModel.title,
                    maxLines: 2,
                    style: AppTextStyles.textStyle20Bold.copyWith(
                      color: AppColors.thirdColor,
                    ),
                  ),
                ),
                const Icon(
                  Icons.favorite_border,
                  size: 35,
                ),
                const Icon(
                  Icons.share,
                  size: 35,
                ),
              ],
            ),
            Text(
              bookModel.author,
              style: AppTextStyles.textStyle18.copyWith(
                color: AppColors.fourthColor.withOpacity(0.8),
              ),
            ),
            Padding(
              padding: AppPaddings.paddingBetweenWidgets,
              child: Row(
                children: [
                  InfoItemWidget(bookModel.category),
                  InfoItemWidget(bookModel.library),
                  InfoItemWidget('Pages: ${bookModel.pages.toString()}'),
                  InfoItemWidget(
                      'Total reviews: ${bookModel.totalReviews.toString()}'),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  bookModel.description,
                  style: AppTextStyles.textStyle20Bold.copyWith(
                    color: AppColors.fourthColor,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.all(10),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius:
                    BorderRadiusDirectional.vertical(top: Radius.circular(20)),
              ),
              child: CustomButton(
                buttonColor: AppColors.secondaryColor,
                textColor: AppColors.primaryColor,
                onTap: () {
                  AppCubit.get(context).addToCart(bookModel);
                  Navigator.pop(context);
                },
                text:
                    'Add to cart\t${bookModel.hasDiscount ? discount() : '${bookModel.price} E.P'}',
              ),
            ),
          ],
        ),
      ),
    );
  }

  String discount() {
    return '${(bookModel.price - (bookModel.price * bookModel.discountValue / 100))} E.P'
        .toString();
  }
}
