import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/function/build_profile_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/widgets/orders_item_list_view.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildProfileAppBar(context, title: "طلباتي"),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: Column(
                  children: [const SizedBox(height: 16), OrdersItemListView()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
