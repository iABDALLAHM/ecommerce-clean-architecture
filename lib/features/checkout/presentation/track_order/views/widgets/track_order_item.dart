import 'package:ecommerce_clean_architecture/core/functions/get_month.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TrackOrderItem extends StatelessWidget {
  const TrackOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    return Container(
      padding: EdgeInsets.only(top: 19, bottom: 19, left: 32),
      decoration: BoxDecoration(color: Color(0xffF9F9F9)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffEBF9F1),
            ),
            child: SvgPicture.asset(Assets.imagesBoxIcon),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "طلب رقم : ${orderEntity.orderNumber}",
                style: AppStyles.textStyle13Bold,
              ),
              Text(
                "تم الطلب : ${orderEntity.date.day} ${getMonth(month: orderEntity.date.month)} ,${orderEntity.date.year}",
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
                          text: "عدد الطلبات ",
                          style: AppStyles.textStyle13Regular.copyWith(
                            color: Color(0xff949D9E),
                          ),
                        ),
                        TextSpan(
                          text: ": ${orderEntity.cartEntity.items.length} -",
                          style: AppStyles.textStyle13Bold,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${orderEntity.cartEntity.calculateTotalPrice().round()} جنيه",
                    style: AppStyles.textStyle13Bold,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }


}
