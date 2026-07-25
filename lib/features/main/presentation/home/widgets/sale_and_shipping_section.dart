import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/banner_button.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SaleAndShippingSection extends StatelessWidget {
  const SaleAndShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Text(LocaleKeys.home_eidOffers.tr(),
          style: AppStyles.textStyle13Regular.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 8),
        const Spacer(),
        Text(LocaleKeys.home_discountPercentage.tr(),
          style: AppStyles.textStyle19Bold.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 25),
        BannerButton(),
        const SizedBox(height: 25),
      ],
    );
  }
}
