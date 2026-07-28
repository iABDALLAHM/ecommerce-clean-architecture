import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeBodyHeader extends StatelessWidget {
  const HomeBodyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.home_bestSellerHomeHeader.tr(),
          style: AppStyles.textStyle16Bold,
        ),
        GestureDetector(
          onTap: () {
            context.go("${AppRoutes.home}${AppRoutes.bestSelling}");
          },
          child: Text(
            LocaleKeys.home_more.tr(),
            style: AppStyles.textStyle13Regular.copyWith(
              color: colorScheme.tertiaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
