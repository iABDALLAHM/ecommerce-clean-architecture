import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/orders_section_body.dart';
import 'package:flutter/material.dart';

class OrdersSection extends StatelessWidget {
  const OrdersSection({super.key});
  static const String routeName = "orders";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOrderSectionAppBar(),
      body: OrdersSectionBody(),
    );
  }

  AppBar buildOrderSectionAppBar() {
    return AppBar(
      centerTitle: true,
      leading: Icon(Icons.arrow_back_ios_new),
      title: Text("طلباتي", style: AppStyles.textStyle19Bold),
    );
  }
}
