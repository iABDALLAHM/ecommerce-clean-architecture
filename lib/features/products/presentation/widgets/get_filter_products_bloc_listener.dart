import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GetFilterProductsBlocListener extends StatelessWidget {
  const GetFilterProductsBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductsCubit, ProductsStates>(
      listener: (context, state) {
        if (state is SuccessProductsState) {
          context.pop();
        } else if (state is FailureProductsState) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      child: child,
    );
  }
}