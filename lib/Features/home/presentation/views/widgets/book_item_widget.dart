import 'package:book_store/Features/home/data/models/book_model.dart';
import 'package:book_store/Features/home/presentation/views/view_book_screen.dart';
import 'package:book_store/Features/home/presentation/views/widgets/info_item_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/functions/cache_image_function.dart';
import '../../../../../Core/utils/functions/navigation.dart';
import '../../../../../Core/utils/style/colors.dart';
import '../../../../../Core/utils/style/text_styles.dart';

class BookItemWidget extends StatelessWidget {
  final BookModel bookModel;
  const BookItemWidget(this.bookModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateTo(
        context,
        ViewBookScreen(bookModel),
      ),
      child: SizedBox(
        height: 220,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 220,
                  width: 180,
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsetsDirectional.only(end: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: cachedImage(
                    imageUrl: bookModel.imageUrl,
                  ),
                ),
                if (bookModel.hasDiscount)
                  Container(
                    height: 30,
                    width: 50,
                    margin: const EdgeInsetsDirectional.only(end: 20, top: 10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Center(
                      child: Text(
                        '${bookModel.discountValue.toInt().toString()}%',
                      ),
                    ),
                  ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 300,
                  child: Text(
                    bookModel.title,
                    maxLines: 2,
                    style: AppTextStyles.textStyle18.copyWith(
                      color: AppColors.thirdColor,
                    ),
                  ),
                ),
                Text(
                  bookModel.author,
                  style: AppTextStyles.textStyle18.copyWith(
                    color: AppColors.fourthColor.withOpacity(0.8),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 250,
                  child: Row(
                    children: [
                      Text(
                          bookModel.hasDiscount
                              ? discount()
                              : '${bookModel.price} E.P',
                          style: AppTextStyles.textStyle20Bold),
                      if (bookModel.hasDiscount)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 10),
                          child: Text(
                            bookModel.price.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.fourthColor,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            '${bookModel.rating}(${bookModel.totalReviews})',
                            style: AppTextStyles.textStyle18.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    InfoItemWidget(bookModel.category),
                    InfoItemWidget(bookModel.library),
                  ],
                ),
              ],
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
