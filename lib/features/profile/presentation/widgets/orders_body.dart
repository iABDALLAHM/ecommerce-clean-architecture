import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/widgets/orders_section_body.dart';
import 'package:flutter/material.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOrderSectionAppBar(context),
      body: SafeArea(bottom: false, child: OrdersSectionBody()),
    );
  }

  AppBar buildOrderSectionAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading:CustomArrowBackAppBar(),
      title: Text("طلباتي", style: AppStyles.textStyle19Bold),
    );
  }
}
