import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/function/build_profile_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/views/widgets/my_cards_view_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/views/widgets/my_cards_view_body.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class MyCardsView extends StatelessWidget {
  const MyCardsView({super.key});
  @override
  Widget build(BuildContext context) {
    return MyCardsViewBlocProvider(
      child: Scaffold(
        appBar: buildProfileAppBar(
          context,
          title: LocaleKeys.profile_myPaymentsPageAppBar.tr(),
        ),
        body: MyCardsViewBody(),
      ),
    );
  }
}
