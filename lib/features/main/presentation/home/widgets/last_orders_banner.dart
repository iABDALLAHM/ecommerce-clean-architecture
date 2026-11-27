import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/get_specific_date.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';
import 'package:ecommerce_clean_architecture/features/last_orders/presentation/cubits/get_my_orders_cubit/get_my_orders_cubit.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LastOrdersBanner extends StatelessWidget {
  const LastOrdersBanner({super.key, required this.orderEntity});
  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    var languageCode = context.locale.languageCode;
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(15),
      decoration: ShapeDecoration(
        color: Color.fromARGB(136, 209, 250, 229),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xffA7F3D0)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.replay, color: Color(0xff16A34A)),
                  const SizedBox(width: 5),
                  Text(
                    "${LocaleKeys.orders_yourPreviousOrderTag.tr(context: context)} ",
                    style: AppStyles.textStyle16Bold,
                  ),
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  var getMyOrdersCubit = context.read<GetMyOrdersCubit>();
                  var cartCubit = context.read<CartCubit>();
                  context.push(
                    AppRoutes.yourLastOrders,
                    extra: {
                      "getMyOrdersCubit": getMyOrdersCubit,
                      "cartCubit": cartCubit,
                    },
                  );
                },
                child: Row(
                  children: [
                    Text(
                      "${LocaleKeys.orders_viewAll.tr(context: context)} ",
                      style: AppStyles.textStyle13Bold,
                    ),
                    RotatedBox(
                      quarterTurns: 6,
                      child: Icon(
                        size: 10,
                        IconData(
                          Icons.arrow_back_ios_new.codePoint,
                          fontFamily: Icons.arrow_back_ios_new.fontFamily,
                          fontPackage: Icons.arrow_back_ios_new.fontPackage,
                          matchTextDirection: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "(${getSpecificDate(date: orderEntity.date, context: context)})",
            style: AppStyles.textStyle16Bold,
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(15),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xffD1FAE5)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: ShapeDecoration(
                    color: Color(0xffF1F5F9),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xffE2E8F0)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Image.network(
                    orderEntity
                        .cartEntity
                        .items[0]
                        .productEntity
                        .productImageUrl,
                    width: 30,
                  ),
                ),
                const SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ""
                      "${orderEntity.cartEntity.items[0].productEntity.productName[languageCode == arabicLanguageCode ? productArabicName : productEnglishName]} ${orderEntity.cartEntity.items.length > 1
                          ? languageCode == arabicLanguageCode
                                ? "واشياء اخرى..."
                                : "And more..."
                          : ""}"
                      "",
                      maxLines: 1,
                      style: AppStyles.textStyle13Bold.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "${orderEntity.cartEntity.items.length} ${languageCode == arabicLanguageCode ? "منتج" : "Items"}",

                            style: AppStyles.textStyle11Regular.copyWith(
                              color: Color(0xff94A3B8),
                            ),
                          ),
                          TextSpan(
                            text: " • ",

                            style: AppStyles.textStyle11Regular.copyWith(
                              color: Color(0xff94A3B8),
                            ),
                          ),
                          TextSpan(
                            text:
                                " ${"${orderEntity.totalPrice} ${languageCode == arabicLanguageCode ? "ج.م" : "EGP"}"}",
                            style: AppStyles.textStyle13Bold.copyWith(
                              color: Color(0xff16A34A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff16A34A),
                    padding: EdgeInsets.all(6),
                  ),
                  onPressed: () {
                    var getMyOrdersCubit = context.read<GetMyOrdersCubit>();
                    var cartCubit = context.read<CartCubit>();
                    context.push(
                      AppRoutes.yourLastOrders,
                      extra: {
                        "getMyOrdersCubit": getMyOrdersCubit,
                        "cartCubit": cartCubit,
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.replay),
                      Text(LocaleKeys.orders_reOrder.tr(context: context)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
