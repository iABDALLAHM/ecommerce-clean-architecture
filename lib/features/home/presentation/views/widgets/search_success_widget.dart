import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_fruit_item.dart';
import 'package:flutter/widgets.dart';

class SearchSuccessWidget extends StatelessWidget {
  const SearchSuccessWidget({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "نتائج البحث ",
          style: AppStyles.textStyle13Regular.copyWith(
            color: Color(0xff949D9E),
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 163 / 214,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
          ),
          itemCount: products.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomFruitItem(productEntity: products[index]);
          },
        ),
      ],
    );
  }
}
