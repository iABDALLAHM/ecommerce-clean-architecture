import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/wallet_view_body.dart';
import 'package:flutter/material.dart';

class WalletBody extends StatelessWidget {
  const WalletBody({super.key});
  static const String routeName = "WalletBody";
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
    leading: CustomArrowBack(),
    centerTitle: true,
    title: Text("المدفوعات", style: AppStyles.textStyle19Bold),
  );
}
