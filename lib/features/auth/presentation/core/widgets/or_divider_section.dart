import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_divider.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class OrDividerSection extends StatelessWidget {
  const OrDividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomDivider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            LocaleKeys.auth_loginPage_orLoginDivider.tr(),
            style: AppStyles.textStyle16SemiBold,
          ),
        ),
        Expanded(child: CustomDivider()),
      ],
    );
  }
}
