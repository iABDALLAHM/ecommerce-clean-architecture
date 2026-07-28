import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/track_order/views/widgets/track_order_status_item.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackOrderStatusList extends StatelessWidget {
  const TrackOrderStatusList({super.key});

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: colorScheme.tertiaryFixedDim,
      child: Column(
        children: [
          TrackOrderStatusItem(
            stepNum: 1,
            stepTitle: LocaleKeys.checkOut_trackOrderPageTrackOrderStatus.tr(),
            stepImageOn: Assets.imagesOpenBoxStatus,
            stepStatus: true,
            stepDate: orderEntity.date,
            stepImageOff: '',
          ),
          TrackOrderStatusItem(
            stepNum: 2,
            stepTitle: LocaleKeys.checkOut_trackOrderPageAcceptOrderStatus.tr(),
            stepImageOff: Assets.imagesAcceptOrderOff,
            stepStatus: orderEntity.orderStatusEntity.acceptOrder,
            stepDate: orderEntity.orderStatusEntity.acceptedAt,
            stepImageOn: Assets.imagesAcceptOrderOn,
          ),
          TrackOrderStatusItem(
            stepNum: 3,
            stepTitle: LocaleKeys.checkOut_trackOrderPageShippedOrderStatus
                .tr(),
            stepImageOff: Assets.imagesShippedOrderImagesOff,
            stepStatus: orderEntity.orderStatusEntity.orderShipped,
            stepDate: orderEntity.orderStatusEntity.shippedAt,
            stepImageOn: Assets.imagesShippedOrderImagesOn,
          ),
          TrackOrderStatusItem(
            stepNum: 4,
            stepTitle: LocaleKeys
                .checkOut_trackOrderPageOutOfDeliveryOrderStatus
                .tr(),
            stepImageOff: Assets.imagesOutOfDeliveryOff,
            stepStatus: orderEntity.orderStatusEntity.outOfDelivery,
            stepDate: orderEntity.orderStatusEntity.outOfDeliveryAt,
            stepImageOn: Assets.imagesOutOfDeliveryOn,
          ),
          TrackOrderStatusItem(
            stepNum: 5,
            stepTitle: LocaleKeys.checkOut_trackOrderPageDeliverdOrderStatus
                .tr(),
            stepImageOff: Assets.imagesOrderDeliverdOff,
            stepStatus: orderEntity.orderStatusEntity.orderDelivered,
            stepDate: orderEntity.orderStatusEntity.deliverdAt,
            stepImageOn: Assets.imagesOrderDeliverdOn,
          ),
        ],
      ),
    );
  }
}
