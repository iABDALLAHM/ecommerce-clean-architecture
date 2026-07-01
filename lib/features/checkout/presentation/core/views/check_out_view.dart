import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/function/build_checkout_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/widgets/check_out_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/widgets/check_out_view_body.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.cartEntity});

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
    return CheckOutViewBlocProvider(
      child: Scaffold(
        appBar: buildCheckOutAppBar(context, currentStep: currentStep),
        body: CheckOutViewBody(
          onChange: (value) {
            setState(() {
              currentStep = value;
            });
          },
        ),
      ),
    );
  }
}
 