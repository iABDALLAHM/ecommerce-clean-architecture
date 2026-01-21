import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/track_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            TrackOrderStatus(),
          ],
        ),
      ),
    );
  }
}

class TrackOrderStatus extends StatelessWidget {
  const TrackOrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: Color(0xffF9F9F9),
      child: Column(
        children: [
          TrackOrderStatusItem(),
          TrackOrderStatusItem(),
          TrackOrderStatusItem(),
          TrackOrderStatusItem(),
          TrackOrderStatusItem(),
        ],
      ),
    );
  }
}

class TrackOrderStatusItem extends StatelessWidget {
  const TrackOrderStatusItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: Color(0xffEBF9F1),
                shape: OvalBorder(),
              ),
              child: SvgPicture.asset(Assets.imagesBoxTrackIcon),
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("تتبع الطلب"), Text("22 مارس , 2024")],
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 30),
            Container(width: 2, height: 30, color: Colors.grey.shade300),
            Expanded(
              child: Divider(
                endIndent: 30,
                indent: 30,
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
