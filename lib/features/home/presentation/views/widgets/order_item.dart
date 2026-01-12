import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/order_details.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/order_item_icon.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
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
              ],
            ),
          ),
        ),
        isActive ? CustomDivider() : Container(color: Colors.red),
      ],
    );
  }
}
