import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/add_order_cubit/add_order_states.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_cubit.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddOrderBlocListener extends StatelessWidget {
  const AddOrderBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddOrderCubit, AddOrderStates>(
      listener: (context, state) {
        if (state is SuccessAddOrderState) {
          showSnackBar(
            context,
            message: LocaleKeys.checkOutSteps_successAddOrderState.tr(),
          );
          context.go(
            AppRoutes.reviewOrder,
            extra: context.read<CheckOutCubit>().orderEntity,
          );
        } else if (state is FailureAddOrderState) {
          showSnackBar(context, message: state.errorMessage);
        } else if (state is LoadingAddOrderState) {
          showSnackBar(
            context,
            message: LocaleKeys.checkOutSteps_loadingAddYourOrderState.tr(),
          );
        }
      },
      child: child,
    );
  }
}
