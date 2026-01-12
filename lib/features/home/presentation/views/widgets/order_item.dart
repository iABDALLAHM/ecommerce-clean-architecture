import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/order_details.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/order_item_icon.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.only(top: 19, bottom: 19, left: 32),
        decoration: BoxDecoration(
          color: const Color.fromARGB(102, 255, 255, 255),
        ),
        child: Row(
          children: [
            OrderItemIcon(),
            const SizedBox(width: 16),
            OrderDetails(),
            Spacer(),
            Column(
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xff292D32),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
