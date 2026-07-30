import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/address_section/cubits/address_validation_cubit/address_validation_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/save_address_cubit/save_address_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/save_payment_details_cubit/save_payment_details_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/payment_section/cubits/payment_validation_cubit/payment_validation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutViewBlocProvider extends StatelessWidget {
  const CheckOutViewBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AddOrderCubit>()),
        BlocProvider(create: (context) => AddressValidationCubit()),
        BlocProvider(create: (context) => PaymentValidationCubit()),
        BlocProvider(create: (context) => getIt<SaveAddressCubit>()),
        BlocProvider(create: (context) => getIt<SavePaymentDetailsCubit>()),
      ],
      child: child,
    );
  }
}
