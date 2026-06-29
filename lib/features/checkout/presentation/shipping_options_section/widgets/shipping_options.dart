import 'dart:developer';

import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/shipping_options_section/widgets/shipping_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingOptions extends StatelessWidget {
  const ShippingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    var totalPrice = context
        .read<OrderEntity>()
        .cartEntity
        .calculateTotalPrice()
        .round()
        .toInt();

    var order = context.watch<OrderEntity>();

    return Column(
      children: [
        ShippingItem(
          onPressed: () {
            order.payWith = true;
            log("The Value of payWith: ${order.payWith.toString()}");
          },
          isSelected: order.payWith == true ? true : false,
          title: "الدفع عند الاستلام",
          subTitle: "التسليم من المكان",
          price: totalPrice + 40,
        ),
        const SizedBox(height: 8),
        ShippingItem(
          onPressed: () {
            order.payWith = false;
            log("The Value of payWith: ${order.payWith.toString()}");
          },
          isSelected: order.payWith == false ? true : false,
          title: "اشتري الان وادفع لاحقا",
          subTitle: "يرجي تحديد طريقه الدفع",
        ),
      ],
    );
  }
}
