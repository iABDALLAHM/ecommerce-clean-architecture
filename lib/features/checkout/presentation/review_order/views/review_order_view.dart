import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/review_order/views/widgets/review_order_view_body.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ReviewOrderView extends StatelessWidget {
  const ReviewOrderView({super.key, required this.orderEntity});
  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          LocaleKeys.checkOut_reviewPageAppBar.tr(),
          style: AppStyles.textStyle19Bold,
        ),
        centerTitle: true,
      ),
      body: ReviewOrderViewBody(orderEntity: orderEntity),
    );
  }
}
