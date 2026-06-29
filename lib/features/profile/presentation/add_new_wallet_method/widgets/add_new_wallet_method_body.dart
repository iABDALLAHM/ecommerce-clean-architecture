import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/function/build_profile_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/widgets/custom_wallet_button.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_wallet_method/widgets/add_new_card_text_field.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_wallet_method/widgets/make_card_default.dart';
import 'package:flutter/material.dart';

class AddNewWalletMethodBody extends StatelessWidget {
  const AddNewWalletMethodBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildProfileAppBar(context, title: "اضافه بطاقه جديده"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              const SizedBox(height: 24),
              AddNewCardTextField(hintText: "اسم حامل البطاقه"),
              const SizedBox(height: 8),
              AddNewCardTextField(hintText: "رقم البطاقة"),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: AddNewCardTextField(hintText: "تاريخ الصلاحيه"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(child: AddNewCardTextField(hintText: "CVV")),
                ],
              ),
              const SizedBox(height: 16),
              MakeCardAsDefault(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.39),
              SizedBox(
                height: 54,
                width: double.infinity,
                child: CustomWalletButton(
                  onPressed: () {},
                  text: "أضف وسيلة دفع جديده",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
