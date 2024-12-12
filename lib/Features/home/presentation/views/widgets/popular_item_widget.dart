import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../Core/utils/functions/cache_image_function.dart';
import '../../../../../Core/utils/style/colors.dart';
import '../../../../../Core/utils/style/text_styles.dart';
import '../../../data/models/book_model.dart';

class PopularItemWidget extends StatelessWidget {
  final BookModel bookModel;

  const PopularItemWidget(this.bookModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          // onTap: () => bottomSheet(context, model),
          child: Container(
            width: 230,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsetsDirectional.only(end: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                /// image

                Container(
                  height: 248,
                  width: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    // image: DecorationImage(
                    //   image: CachedNetworkImageProvider(bookModel.imageUrl,),
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                  child: cachedImage(
                    imageUrl: bookModel.imageUrl,
                  ),
                ),

                /// rate

                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        bookModel.rating.toString(),
                        style: AppTextStyles.textStyle18
                            .copyWith(color: Colors.yellow),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 130,
          width: 220,
          child: Text(
            bookModel.title,
            style: AppTextStyles.textStyle18.copyWith(
              color: AppColors.thirdColor,
            ),
          ),
        ),
      ],
    );
  }
}
