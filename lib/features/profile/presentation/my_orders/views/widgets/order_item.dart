import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/order_details.dart';
import 'package:ecommerce_clean_architecture/core/widgets/order_item_icon.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/entities/my_order_entity/my_order_entity.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/order_status_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key, required this.myOrderEntity});
  final MyOrderEntity myOrderEntity;
  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {

    var myOrderEntity = context.read<MyOrderEntity>();

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
                      stepIndex: 1,
                      title: "تتبع الطلب",
                      date: myOrderEntity.date,
                      isDone: true,
                    ),
                    OrderStatusItem(
                      title: "قبول الطلب",
                      date: myOrderEntity.orderStatusEntity.acceptedAt,
                      isDone: myOrderEntity.orderStatusEntity.acceptOrder,
                      stepIndex: 2,
                    ),
                    OrderStatusItem(
                      title: "تم شحن الطلب",
                      date: myOrderEntity.orderStatusEntity.shippedAt,
                      isDone: myOrderEntity.orderStatusEntity.orderShipped,
                      stepIndex: 3,
                    ),
                    OrderStatusItem(
                      title: "خرج للتوصيل",
                      date: myOrderEntity.orderStatusEntity.outOfDeliveryAt,
                      isDone: myOrderEntity.orderStatusEntity.outOfDelivery,
                      stepIndex: 4,
                    ),
                    OrderStatusItem(
                      title: "تم التسليم",
                      date: myOrderEntity.orderStatusEntity.deliverdAt,
                      isDone: myOrderEntity.orderStatusEntity.orderDelivered,
                      stepIndex: 5,
                    ),
                  ],
                )
              : Container(color: Colors.white),
        ],
      ),
    );
  }
}
