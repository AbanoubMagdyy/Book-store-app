import 'package:book_store/Core/utils/style/text_styles.dart';
import 'package:book_store/Features/home/presentation/views/widgets/book_item_widget.dart';
import 'package:flutter/material.dart';
import '../../../../Core/utils/style/colors.dart';
import '../../../../Core/utils/widgets/custom_button.dart';
import '../../data/models/book_model.dart';

class CartScreen extends StatelessWidget {
  final List<BookModel> books;
  const CartScreen(this.books, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: books.length,
                itemBuilder: (context, index) => BookItemWidget(
                  books[index],
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: AppTextStyles.textStyle18,
                      ),
                      const Spacer(),
                      Text(
                        '${total().toString()} E.P',
                        style: AppTextStyles.textStyle18,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Discount',
                        style: AppTextStyles.textStyle18,
                      ),
                      const Spacer(),
                      Text(
                        '${discount().toString()} E.P',
                        style: AppTextStyles.textStyle18,
                      ),
                    ],
                  ),
                  CustomButton(
                      buttonColor: AppColors.secondaryColor,
                      textColor: AppColors.primaryColor,
                      onTap: () {},
                      text: 'Pay ${total() - discount()} E.P'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double total() {
    double total = 0;
    for (var i in books) {
      total = total + i.price;
    }
    return total;
  }

  double discount() {
    double discount = 0;
    for (var i in books) {
      discount = discount + (i.price * i.discountValue / 100);
    }
    return discount;
  }
}
