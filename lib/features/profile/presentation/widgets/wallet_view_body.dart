import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/widgets/custom_wallet_button.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/widgets/wallet_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 16),
            WalletItem(
              walletCode: "**** 1234 ",
              walletIcon: Assets.imagesMasterCardIcon,
            ),
            const SizedBox(height: 16),
            WalletItem(
              walletCode: "**** 4887 ",
              walletIcon: Assets.imagesVisaIcon,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.4),
            SizedBox(
              height: 54,
              width: double.infinity,
              child: CustomWalletButton(
                onPressed: () {
                  context.go("${AppRoutes.profile}${AppRoutes.myPayments}${AppRoutes.addNewPayment}");
                },
                text: "أضف وسيلة دفع جديده",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
