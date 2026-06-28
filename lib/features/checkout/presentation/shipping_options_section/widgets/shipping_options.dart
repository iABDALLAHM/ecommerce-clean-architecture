import 'dart:developer';

import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/shipping_options_section/widgets/shipping_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingOptions extends StatefulWidget {
  const ShippingOptions({super.key});

  @override
  State<ShippingOptions> createState() => _ShippingOptionsState();
}

class _ShippingOptionsState extends State<ShippingOptions> {
  int isSelected = -1;

  @override
  Widget build(BuildContext context) {
    var totalPrice = context
        .read<OrderEntity>()
        .cartEntity
        .calculateTotalPrice()
        .round()
        .toInt();

    var payWith = context.read<OrderEntity>().payWith;

    return Column(
      children: [
        ShippingItem(
          onPressed: () {
            setState(() {
              isSelected = 0;
              payWith = true;
            });
            log("The Value of payWith: ${payWith.toString()}");
          },
          isSelected: isSelected == 0 ? true : false,
          title: "الدفع عند الاستلام",
          subTitle: "التسليم من المكان",
          price: totalPrice + 40,
        ),
        const SizedBox(height: 8),
        ShippingItem(
          onPressed: () {
            setState(() {
              isSelected = 1;
              payWith = false;
            });
            log("The Value of payWith: ${payWith.toString()}");
          },
          isSelected: isSelected == 1 ? true : false,
          title: "اشتري الان وادفع لاحقا",
          subTitle: "يرجي تحديد طريقه الدفع",
          price: totalPrice,
        ),
      ],
    );
  }
}
