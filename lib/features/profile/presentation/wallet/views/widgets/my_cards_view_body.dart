import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_circular_progress_widget.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/cubits/add_new_card_cubit/add_new_card_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/cubits/get_my_cards_cubit/get_my_cards_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/cubits/get_my_cards_cubit/get_my_cards_state.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/views/widgets/custom_my_cards_button.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/views/widgets/my_card_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyCardsViewBody extends StatefulWidget {
  const MyCardsViewBody({super.key});

  @override
  State<MyCardsViewBody> createState() => _MyCardsViewBodyState();
}

class _MyCardsViewBodyState extends State<MyCardsViewBody> {
  @override
  void initState() {
    context.read<GetMyCardsCubit>().getAllMyCards(
      uId: getIt.get<SharedPrefService>().getData(key: "user-id"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 16),
          BlocBuilder<GetMyCardsCubit, GetMyCardsState>(
            builder: (context, state) {
              if (state is SuccessGetMyCardsState) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.cardsList.length,
                    itemBuilder: (context, index) {
                      return MyCardItem(cardEntity: state.cardsList[index]);
                    },
                  ),
                );
              } else if (state is LoadingGetMyCardsState) {
                return Expanded(child: CustomCircularProgressWidget());
              } else if (state is FailureGetMyCardsState) {
                return Expanded(child: Text(state.errorMessage));
              } else if (state is EmptyCardsState) {
                return Expanded(
                  child: Text(
                    "لا يوجد لديك أي كارت بنكي",
                    style: AppStyles.textStyle19Bold.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                );
              } else {
                return Expanded(child: SizedBox());
              }
            },
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height * 0.4),
          SizedBox(
            height: 54,
            width: double.infinity,
            child: CustomWalletButton(
              onPressed: () {
                var addNewCardCubit = context.read<AddNewCardCubit>();
                var getMyCardsCubit = context.read<GetMyCardsCubit>();

                context.push(
                  "${AppRoutes.profile}${AppRoutes.myPayments}${AppRoutes.addNewPayment}",
                  extra: {
                    "AddNewCardCubit": addNewCardCubit,
                    "GetMyCardsCubit": getMyCardsCubit,
                  },
                );
              },
              text: "أضف وسيلة دفع جديده",
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
