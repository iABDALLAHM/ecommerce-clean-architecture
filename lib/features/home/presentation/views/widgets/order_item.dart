import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/order_details.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/order_item_icon.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/order_status_item.dart';
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
    return Card(
      elevation: 0,
      child: Column(
        children: [
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.only(top: 19, bottom: 19, left: 32),
              decoration: BoxDecoration(color: Color(0xffF9F9F9)),
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
          isActive
              ? Column(
                  children: [
                    Container(
                      color: Color(0xffF9F9F9),
                      child: Divider(color: Color(0xffEBEBEB)),
                    ),
                    OrderStatusItem(
                      title: "تتبع الطلب",
                      date: "22 مارس, 2024",
                      isDone: true,
                    ),
                    OrderStatusItem(
                      title: "قبول الطلب",
                      date: "22 مارس, 2024",
                      isDone: true,
                    ),
                    OrderStatusItem(
                      title: "تم شحن الطلب",
                      date: "22 مارس, 2024",
                      isDone: true,
                    ),
                    OrderStatusItem(title: "خرج للتوصيل", isDone: false),
                    OrderStatusItem(title: "تم التسليم", isDone: false),
                  ],
                )
              : Container(color: Colors.white),
        ],
      ),
    );
  }
}
