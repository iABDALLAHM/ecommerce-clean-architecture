import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/add_new_wallet_method_view_body.dart';
import 'package:flutter/material.dart';

class AddNewWalletMethodView extends StatelessWidget {
  const AddNewWalletMethodView({super.key});
  static const String routeName = "AddNewWalletMethodView";
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
        Navigator.of(context).pop();
      },
      child: Icon(Icons.arrow_back_ios_new),
    ),
    centerTitle: true,
    title: Text("اضافه بطاقه جديده", style: AppStyles.textStyle19Bold),
  );
}
