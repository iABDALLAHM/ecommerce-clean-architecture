import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/cubits/get_my_orders_cubit/get_my_orders_stream_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersBlocProvider extends StatelessWidget {
  const MyOrdersBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMyOrdersStreamCubit(
        ordersRepository: getIt.get<OrdersRepository>(),
      ),
      child: child,
    );
  }
}
