import 'package:ecommerce_clean_architecture/features/profile/presentation/core/function/build_profile_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/my_orders_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyOrdersBlocProvider(
      child: Scaffold(
        appBar: buildProfileAppBar(context, title: "طلباتي"),
        body: MyOrdersViewBody(),
      ),
    );
  }
}
