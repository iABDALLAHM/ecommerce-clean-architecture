import 'package:ecommerce_clean_architecture/core/entities/cart_entity.dart';
import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/repos/order_repo/orders_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/function/build_checkout_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/add_order_cubit_bloc_consumer.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/check_out_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.cartEntity});
  static const String routeName = "checkout";
  final CartEntity cartEntity;
  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int currentStep = 0;
  late OrderEntity orderEntity;
  @override
  void initState() {
    orderEntity = OrderEntity(
      uId: getUserData().uId,
      cartEntity: widget.cartEntity,
      shippingAddressEntity: ShippingAddressEntity(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(orderRepo: getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: buildCheckOutAppBar(context, currentStep: currentStep),
        body: Provider.value(
          value: orderEntity,
          child: AddOrderCubitBlocConsumer(
            child: CheckOutViewBody(
              onChange: (value) {
                currentStep = value;
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
