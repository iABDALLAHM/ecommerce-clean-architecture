import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/get_month.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TrackOrderItem extends StatelessWidget {
  const TrackOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    var languageCode = context.locale.languageCode;
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.only(top: 19, bottom: 19, left: 15),
      decoration: BoxDecoration(color: colorScheme.tertiaryFixedDim),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primaryContainer,
            ),
            child: SvgPicture.asset(Assets.imagesBoxIcon),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${LocaleKeys.checkout_trackOrderPageOrderNumber.tr(context: context)} ${orderEntity.orderNumber}",
                style: AppStyles.textStyle13Bold,
              ),
              Text(
                "${LocaleKeys.checkout_trackOrderPageOrderedAt.tr(context: context)} ${orderEntity.date.day} ${languageCode == arabicLanguageCode ? getMonthInArabic(month: orderEntity.date.month) : getMonthInEnglish(month: orderEntity.date.month)} ,${orderEntity.date.year}",
                style: AppStyles.textStyle11Regular.copyWith(
                  color: colorScheme.tertiaryContainer,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: LocaleKeys.checkout_trackOrderPageNumberOfItems
                              .tr(context: context),
                          style: AppStyles.textStyle13Regular.copyWith(
                            color: colorScheme.tertiaryContainer,
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
