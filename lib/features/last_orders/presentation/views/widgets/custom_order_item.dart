import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/get_specific_date.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';
import 'package:ecommerce_clean_architecture/features/last_orders/presentation/views/widgets/custom_item.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomOrderItem extends StatelessWidget {
  const CustomOrderItem({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    var languageCode = context.locale.languageCode;
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xffE2E8F0)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${languageCode == arabicLanguageCode ? "الإجمالي" : "Total"}:${orderEntity.totalPrice.toInt()} ${languageCode == arabicLanguageCode ? "ج.م" : "EGP"}",
                style: AppStyles.textStyle16Bold,
              ),
              const SizedBox(width: 5),
              Spacer(),
              Text(
                "${orderEntity.orderNumber} ",
                style: AppStyles.textStyle16Bold,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(getSpecificDate(date: orderEntity.date, context: context)),
          Divider(color: Color(0xffF1F5F9)),
          const SizedBox(height: 5),
          Column(
            children: List.generate(orderEntity.cartEntity.items.length, (
              index,
            ) {
              var currentItem = orderEntity.cartEntity.items[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CustomItem(
                  itemImage: currentItem.productEntity.productImageUrl,
                  itemPrice: currentItem.productEntity.productPrice.toString(),
                  itemName:
                      currentItem.productEntity.productName[languageCode ==
                              arabicLanguageCode
                          ? productArabicName
                          : productEnglishName] ??
                      "",
                  date: DateTime.now(),
                ),
              );
            }),
          ),
          const SizedBox(height: 5),
          Divider(color: Color(0xffF1F5F9)),
          const SizedBox(height: 5),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(width: 2, color: Color(0xff16A34A)),
              ),
              backgroundColor: Colors.white,
              foregroundColor: Color(0xff16A34A),
              padding: EdgeInsets.all(6),
            ),
            onPressed: () {
              final cartCubit = context.read<CartCubit>();
              context.push(
                AppRoutes.checkOut,
                extra: {"cartCubit": cartCubit, "orderEntity": orderEntity},
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.replay),
                Text(LocaleKeys.orders_reOrder.tr(context: context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
