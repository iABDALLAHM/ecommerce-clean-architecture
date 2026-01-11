import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/manager/add_order_cubit/add_order_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderCubitBlocConsumer extends StatelessWidget {
  const AddOrderCubitBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderStates>(
      listener: (context, state) {
        if (state is SuccessAddOrderState) {
          showSnackBar(context, message: "تم إضافة المنتج بنجاح");
          
        } else if (state is FailureAddOrderState) {
          showSnackBar(context, message: "فشل اضافة المنتج حاول مرة آخرى");
        }
      },
      builder: (context, state) {
        return CustomProgressWidget(
          state: state is LoadingAddOrderState,
          child: child,
        );
      },
    );
  }
}
