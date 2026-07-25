import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ProfileBodyAppBar extends StatelessWidget {
  const ProfileBodyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.profile_profilePageAppBar.tr(),
          style: AppStyles.textStyle19Bold,
        ),
      ],
    );
  }
}
