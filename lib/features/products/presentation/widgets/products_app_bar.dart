import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/widgets/custom_notification_icon.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text(
          LocaleKeys.home_productsPageAppBar.tr(),
          style: AppStyles.textStyle19Bold,
        ),
        Spacer(),
        CustomNotificationIcon(),
      ],
    );
  }
}
