import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/function/build_checkout_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/widgets/check_out_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/widgets/check_out_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.cartEntity});

  final CartEntity cartEntity;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is SuccessGetUserDataState) {
          return CheckOutViewBlocProvider(
            child: BlocProvider(
              create: (context) => getIt<CheckOutCubit>()
                ..initializeOrder(
                  cartEntity: widget.cartEntity,
                  uId: state.userEntity.uId,
                ),
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
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
