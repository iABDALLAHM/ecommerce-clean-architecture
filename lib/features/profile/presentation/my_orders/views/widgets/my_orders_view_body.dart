import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_circular_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/cubits/get_my_orders_cubit/get_my_orders_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/cubits/get_my_orders_cubit/get_my_orders_state.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/orders_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersViewBody extends StatefulWidget {
  const MyOrdersViewBody({super.key});

  @override
  State<MyOrdersViewBody> createState() => _MyOrdersViewBodyState();
}

class _MyOrdersViewBodyState extends State<MyOrdersViewBody> {

  @override
  void initState() {
    context.read<GetMyOrdersCubit>().getAllOrders(
      userId: getIt.get<SharedPrefService>().getData(key: "user-id"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  BlocBuilder<GetMyOrdersCubit, GetMyOrdersState>(
                    builder: (context, state) {
                      if (state is SuccessGetMyOrdersState) {
                        return OrdersItemListView(myOrders: state.myOrders);
                      } else if (state is EmptyOrdersState) {
                        return Text("لا يوجد لديك اي أوردارات");
                      } else if (state is LoadingGetMyOrdersState) {
                        return CustomCircularProgressWidget();
                      }
                      return OrdersItemListView(myOrders: []);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
