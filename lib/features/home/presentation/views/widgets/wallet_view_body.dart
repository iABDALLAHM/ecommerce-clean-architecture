import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/wallet_item.dart';
import 'package:flutter/material.dart';

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
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
              child: CustomButton(
                text: "أضف وسيلة دفع جديده",
                onPressed: () {
                  Navigator.of(context).pushNamed("routeName");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
