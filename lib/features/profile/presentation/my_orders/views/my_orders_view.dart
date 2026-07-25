import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/function/build_profile_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/my_orders_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/views/widgets/my_orders_view_body.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyOrdersBlocProvider(
      child: Scaffold(
        appBar: buildProfileAppBar(
          context,
          title: LocaleKeys.profile_myOrdersPageAppBar.tr(),
        ),
        body: MyOrdersViewBody(),
      ),
    );
  }
}
