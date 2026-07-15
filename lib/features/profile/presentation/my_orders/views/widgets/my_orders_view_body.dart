import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_circular_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/cubits/get_my_orders_cubit/get_my_orders_stream_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/cubits/get_my_orders_cubit/get_my_orders_stream_state.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/orders_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

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
                  BlocBuilder<GetMyOrdersStreamCubit, GetMyOrdersState>(
                    builder: (context, state) {
                      if (state is SuccessGetMyOrdersState) {
                        return OrdersItemListView(myOrders: state.myOrders);
                      } else if (state is EmptyOrdersState) {
                        return Text(
                          "لا يوجد لديك اي أوردارات أطلب الأن",
                          style: AppStyles.textStyle19Bold.copyWith(
                            color: AppColors.lightPrimaryColor,
                          ),
                        );
                      } else if (state is LoadingGetMyOrdersState) {
                        return CustomCircularProgressWidget();
                      }
                      return SizedBox();
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
