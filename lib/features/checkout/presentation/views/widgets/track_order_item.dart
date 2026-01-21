import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/order_details.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/order_item_icon.dart';
import 'package:flutter/material.dart';

class TrackOrderItem extends StatelessWidget {
  const TrackOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 19, bottom: 19, left: 32),
      decoration: BoxDecoration(color: Color(0xffF9F9F9)),
      child: Row(
        children: [
          OrderItemIcon(),
          const SizedBox(width: 16),
          OrderDetails(),
          Spacer(),
        ],
      ),
    );
  }
}
