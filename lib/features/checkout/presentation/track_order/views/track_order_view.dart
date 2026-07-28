import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/track_order/views/widgets/track_order_view_body.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTrackOrderAppBar(),
      body: Provider.value(value: orderEntity, child: TrackOrderViewBody()),
    );
  }

  AppBar buildTrackOrderAppBar() {
    return AppBar(
      leading: CustomArrowBackAppBar(),
      title: Text(LocaleKeys.checkOut_trackOrderPageAppBar.tr()),
    );
  }
}
