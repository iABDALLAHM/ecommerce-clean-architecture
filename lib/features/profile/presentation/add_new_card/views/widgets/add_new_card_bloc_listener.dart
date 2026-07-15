import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/cubits/add_new_card_cubit/add_new_card_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/cubits/add_new_card_cubit/add_new_card_state.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/cubits/get_my_cards_cubit/get_my_cards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddNewCardBlocListener extends StatelessWidget {
  const AddNewCardBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewCardCubit, AddNewCardState>(
      listener: (context, state) {
        if (state is SuccessAddNewCardState) {
          showSnackBar(context, message: "تم اضافة الكارت بنجاح");
          context.read<GetMyCardsCubit>().getAllMyCards(
            uId: getIt.get<SharedPrefService>().getData(key: "user-id"),
          );
          context.pop();
        } else if (state is FailureAddNewCardState) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      child: child,
    );
  }
}
