
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        SizedBox(width: width * 0.3),
        Text("السلة", style: AppStyles.textStyle19Bold),
      ],
    );
  }
}
