import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/cubits/add_new_card_cubit/add_new_card_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/views/widgets/add_new_card_view_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/function/build_profile_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/cubits/get_my_cards_cubit/get_my_cards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCardView extends StatelessWidget {
  const AddNewCardView({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildProfileAppBar(context, title: "اضافه بطاقه جديده"),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: data["AddNewCardCubit"] as AddNewCardCubit),

          BlocProvider.value(value: data["GetMyCardsCubit"] as GetMyCardsCubit),
        ],
        child: AddNewCardViewBody(),
      ),
    );
  }
}
