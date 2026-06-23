import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/widgets/wallet_view_body.dart';
import 'package:flutter/material.dart';

class WalletBody extends StatelessWidget {
  const WalletBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildWalletBodyAppBar(context),
      body: WalletViewBody(),
    );
  }

  AppBar buildWalletBodyAppBar(BuildContext context) => AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(Icons.edit, color: Color(0xff949D9E)),
      ),
    ],
    leading: CustomArrowBackAppBar(),
    centerTitle: true,
    title: Text("المدفوعات", style: AppStyles.textStyle19Bold),
  );
}
