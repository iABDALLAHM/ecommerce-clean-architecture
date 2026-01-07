import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_view_body.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});
  static const String routeName = "checkout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("الشحن", style: AppStyles.textStyle19Bold),
      ),
      body: CheckOutViewBody(),
    );
  }
}
