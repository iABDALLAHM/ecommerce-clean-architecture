import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/repositories/payment_repository/payment_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/cubits/add_new_card_cubit/add_new_card_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/cubits/get_my_cards_cubit/get_my_cards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCardsViewBlocProvider extends StatelessWidget {
  const MyCardsViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNewCardCubit(
            paymentRepository: getIt.get<PaymentRepository>(),
            secureStorageRepository: getIt.get<SecureStorageRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => GetMyCardsCubit(
            paymentRepository: getIt.get<PaymentRepository>(),
            secureStorageRepository: getIt.get<SecureStorageRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
