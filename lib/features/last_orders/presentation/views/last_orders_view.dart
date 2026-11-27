import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/last_orders/presentation/cubits/get_my_orders_cubit/get_my_orders_cubit.dart';
import 'package:ecommerce_clean_architecture/features/last_orders/presentation/views/widgets/last_orders_view_body.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LastOrdersView extends StatelessWidget {
  const LastOrdersView({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider.value(value: data["getMyOrdersCubit"] as GetMyOrdersCubit),
        BlocProvider.value(value: data["cartCubit"] as CartCubit),
      ],
      child: Scaffold(
        appBar: _buildLastOrdersAppBar(context: context),
        body: LastOrdersViewBody(),
      ),
    );
  }

  AppBar _buildLastOrdersAppBar({required BuildContext context}) {
    var colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      leading: CustomArrowBackAppBar(),
      title: Text(
        LocaleKeys.orders_lastOrderViewAppBar.tr(context: context),
        style: TextStyle(color: colorScheme.onSurface),
      ),
    );
  }
}
