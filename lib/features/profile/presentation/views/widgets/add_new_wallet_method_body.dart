import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/views/widgets/add_new_wallet_method_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewWalletMethodBody extends StatelessWidget {
  const AddNewWalletMethodBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAddNewWalletMethodAppBar(context),
      body: AddNewWalletMethodViewBody(),
    );
  }

  AppBar buildAddNewWalletMethodAppBar(BuildContext context) => AppBar(
    leading: GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Icon(Icons.arrow_back_ios_new),
    ),
    centerTitle: true,
    title: Text("اضافه بطاقه جديده", style: AppStyles.textStyle19Bold),
  );
}
