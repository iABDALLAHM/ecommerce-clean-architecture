import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/custom_fruit_item.dart';
import 'package:flutter/widgets.dart';

class SearchSuccessWidget extends StatelessWidget {
  const SearchSuccessWidget({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            "نتائج البحث ",
            style: AppStyles.textStyle13Regular.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 170 / 230,
              crossAxisCount: 2,
            ),
            itemCount: products.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CustomFruitItem(productEntity: products[index]);
            },
          ),
        ],
      ),
    );
  }
}
