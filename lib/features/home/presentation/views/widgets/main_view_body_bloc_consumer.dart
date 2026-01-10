import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit.dart/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit.dart/cart_states.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key, required this.currentBody});

  final int currentBody;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit,CartStates>(
      listener: (context, state) {
        if (state is ProductAddedState) {
          showSnackBar(context, message: "تم إضافة المنتج بنجاح");
        } else if (state is ProductRemovedState) {
          showSnackBar(context, message: "تم ازالة المنتج من العربة");
        } else if (state is ProductExistState) {
          showSnackBar(context, message: "المنتج موجود بالفعل");
        }
      },
      child: MainViewBody(currentBody: currentBody),
    );
  }
}
