import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/track_order/views/widgets/track_order_item.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/track_order/views/widgets/track_order_status_list.dart';
import 'package:flutter/material.dart';

class TrackOrderViewBody extends StatelessWidget {
  const TrackOrderViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 16),
            TrackOrderItem(),
            const SizedBox(height: 16),
            TrackOrderStatusList(),
          ],
        ),
      ),
    );
  }
}
