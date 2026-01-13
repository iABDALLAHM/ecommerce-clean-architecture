import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
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
    actions: [Icon(Icons.edit, color: Color(0xff949D9E))],
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(Icons.arrow_back_ios_new),
    ),
    centerTitle: true,
    title: Text("المدفوعات", style: AppStyles.textStyle19Bold),
  );
}
