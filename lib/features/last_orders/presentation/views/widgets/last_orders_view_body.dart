import 'package:ecommerce_clean_architecture/features/last_orders/presentation/cubits/get_my_orders_cubit/get_my_orders_cubit.dart';
import 'package:ecommerce_clean_architecture/features/last_orders/presentation/cubits/get_my_orders_cubit/get_my_orders_state.dart';
import 'package:ecommerce_clean_architecture/features/last_orders/presentation/views/widgets/custom_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastOrdersViewBody extends StatefulWidget {
  const LastOrdersViewBody({super.key});

  @override
  State<LastOrdersViewBody> createState() => _LastOrdersViewBodyState();
}

class _LastOrdersViewBodyState extends State<LastOrdersViewBody> {
  @override
  void initState() {
    context.read<GetMyOrdersCubit>().getMyOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: BlocBuilder<GetMyOrdersCubit, GetMyOrdersState>(
        builder: (context, state) {
          if (state is GetMyOrdersSuccessState) {
            List deliverdItems = state.listOfOrders
                .where(
                  (order) => order.orderStatusEntity.orderDelivered == true,
                )
                .toList();
            return ListView.separated(
              itemBuilder: (context, index) {
                return CustomOrderItem(orderEntity: deliverdItems[index]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: deliverdItems.length,
            );
          } else if (state is GetMyOrdersLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return SizedBox();
        },
      ),
    );
  }
}
