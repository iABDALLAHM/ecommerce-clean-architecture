import 'package:ecommerce_clean_architecture/features/home/domain/repos/orders_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutViewBlocProvider extends StatelessWidget {
  const CheckOutViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(orderRepo: getIt.get<OrdersRepo>()),
      child: child,
    );
  }
}
