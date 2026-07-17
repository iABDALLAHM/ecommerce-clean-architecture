import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersItemListView extends StatelessWidget {
  const OrdersItemListView({super.key, required this.myOrders});
  final List<OrderEntity> myOrders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myOrders.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Provider.value(
          value: myOrders[index],
          child: OrderItem(myOrderEntity: myOrders[index]),
        );
      },
    );
  }
}
