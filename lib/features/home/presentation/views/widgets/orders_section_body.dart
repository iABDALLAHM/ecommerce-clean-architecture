import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/orders_item_list_view.dart';
import 'package:flutter/material.dart';

class OrdersSectionBody extends StatelessWidget {
  const OrdersSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [const SizedBox(height: 16), OrdersItemListView()],
            ),
          ),
        ),
      ],
    );
  }
}
