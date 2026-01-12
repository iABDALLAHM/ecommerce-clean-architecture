import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrdersSectionBody extends StatelessWidget {
  const OrdersSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [const SizedBox(height: 16), OrderItem()]);
  }
}
