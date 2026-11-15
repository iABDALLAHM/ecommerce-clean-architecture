import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/order_details.dart';
import 'package:ecommerce_clean_architecture/core/widgets/order_item_icon.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/order_status_item.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key, required this.myOrderEntity});
  final OrderEntity myOrderEntity;
  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    var myOrderEntity = context.read<OrderEntity>();
    var colorScheme = Theme.of(context).colorScheme;
    var languageCode = context.locale.languageCode;

    return Card(
      elevation: 0,
      child: Column(
        children: [
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.only(top: 19, bottom: 19, left: 15),
              decoration: BoxDecoration(color: colorScheme.tertiaryFixedDim),
              child: Row(
                children: [
                  OrderItemIcon(),
                  const SizedBox(width: 16),
                  OrderDetails(),
                  Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          isActive = !isActive;
                          setState(() {});
                        },
                        child: RotatedBox(
                          quarterTurns: isActive ? 3 : 1,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xff292D32),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),

          isActive
              ? Column(
                  children: [
                    Container(
                      color: colorScheme.tertiaryFixedDim,
                      child: Divider(color: colorScheme.surface),
                    ),
                    OrderStatusItem(
                      stepIndex: 1,
                      title: LocaleKeys.profile_myOrdersPageTrackOrderStatus
                          .tr(),
                      date: myOrderEntity.date,
                      isDone: true,
                    ),
                    OrderStatusItem(
                      title: LocaleKeys.profile_myOrdersPageAcceptOrderStatus
                          .tr(),
                      date: myOrderEntity.orderStatusEntity.acceptedAt,
                      isDone: myOrderEntity.orderStatusEntity.acceptOrder,
                      stepIndex: 2,
                    ),
                    OrderStatusItem(
                      title: LocaleKeys.profile_myOrdersPageOrderShippedStatus
                          .tr(),
                      date: myOrderEntity.orderStatusEntity.shippedAt,
                      isDone: myOrderEntity.orderStatusEntity.orderShipped,
                      stepIndex: 3,
                    ),
                    OrderStatusItem(
                      title: LocaleKeys
                          .profile_myOrdersPageOrderOutOfDeliveryStatus
                          .tr(),
                      date: myOrderEntity.orderStatusEntity.outOfDeliveryAt,
                      isDone: myOrderEntity.orderStatusEntity.outOfDelivery,
                      stepIndex: 4,
                    ),
                    OrderStatusItem(
                      title: LocaleKeys.profile_myOrdersPageOrderDeliverdStatus
                          .tr(),
                      date: myOrderEntity.orderStatusEntity.deliverdAt,
                      isDone: myOrderEntity.orderStatusEntity.orderDelivered,
                      stepIndex: 5,
                    ),
                  ],
                )
              : Container(color: colorScheme.surface),

          isActive
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      LocaleKeys.PurchasedItems.tr(),
                      style: AppStyles.textStyle16Regular,
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: List.generate(
                        widget.myOrderEntity.cartEntity.items.length,
                        (index) {
                          var productEntity = widget
                              .myOrderEntity
                              .cartEntity
                              .items[index]
                              .productEntity;

                          return Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Text(
                                      style: AppStyles.textStyle13Bold.copyWith(
                                        color: colorScheme.primary,
                                      ),
                                      languageCode == arabicLanguageCode
                                          ? productEntity
                                                    .productName[productArabicName] ??
                                                ""
                                          : productEntity
                                                    .productName[productEnglishName] ??
                                                "",
                                    ),
                                    const SizedBox(width: 20),
                                    CircleAvatar(
                                      radius: 20,
                                      child: Image.network(
                                        productEntity.productImageUrl,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              myOrderEntity.orderStatusEntity.orderDelivered ==
                                      true
                                  ? Expanded(
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),

                                          backgroundColor:
                                              colorScheme.secondaryContainer,
                                        ),
                                        onPressed: () {
                                          Map<String, dynamic> data = {
                                            'productEntity': productEntity,
                                            'AddReviewsCubit': context
                                                .read<AddReviewCubit>(),
                                            'GetReviewsCubit': context
                                                .read<GetReviewsCubit>(),
                                            "canReview": true,
                                          };
                                          context.push(
                                            AppRoutes.reviewAndRating,
                                            extra: data,
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.edit_note_rounded),
                                            const SizedBox(width: 20),
                                            Text(
                                              LocaleKeys.LeaveAReview.tr(),
                                              style: AppStyles.textStyle13Bold
                                                  .copyWith(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
