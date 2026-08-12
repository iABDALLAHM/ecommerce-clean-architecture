import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_circular_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/cubits/get_my_orders_cubit/get_my_orders_stream_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/cubits/get_my_orders_cubit/get_my_orders_stream_state.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/orders_item_list_view.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: const SizedBox(height: 16)),
          BlocBuilder<GetMyOrdersStreamCubit, GetMyOrdersState>(
            builder: (context, state) {
              if (state is SuccessGetMyOrdersState) {
                return SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                  sliver: SliverToBoxAdapter(child: OrdersItemListView(myOrders: state.myOrders)),
                );
              } else if (state is EmptyOrdersState) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      LocaleKeys.profileStatus_emptyOrdersState.tr(),
                      style: AppStyles.textStyle19Bold.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                );
              } else if (state is LoadingGetMyOrdersState) {
                return SliverToBoxAdapter(
                  child: CustomCircularProgressWidget(),
                );
              }
              return SliverToBoxAdapter(child: SizedBox());
            },
          ),
        ],
      ),
    );
  }
}
