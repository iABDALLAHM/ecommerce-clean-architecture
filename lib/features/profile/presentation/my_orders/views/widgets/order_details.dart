import 'package:ecommerce_clean_architecture/core/functions/get_specific_date.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/my_order_entity/my_order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var myOrderEntity = context.read<MyOrderEntity>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "طلب رقم: ${myOrderEntity.orderNumber}",
          style: AppStyles.textStyle13Bold,
        ),
        Text(
          "تم الطلب: ${getSpecificDate(date: myOrderEntity.date)}",
          style: AppStyles.textStyle11Regular.copyWith(
            color: Color(0xff949D9E),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "عدد الطلبات",
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: Color(0xff949D9E),
                    ),
                  ),
                  TextSpan(
                    text: ": ${myOrderEntity.products.length} -",
                    style: AppStyles.textStyle13Bold,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Text(
              "${myOrderEntity.totalPrice.round()} جنية",
              style: AppStyles.textStyle13Bold,
            ),
          ],
        ),
      ],
    );
  }
}
