import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new, color: colorScheme.onSurface),
        ),
        SizedBox(width: width * 0.3),
        Text(
          LocaleKeys.home_cartPageAppBar.tr(),
          style: AppStyles.textStyle19Bold,
        ),
      ],
    );
  }
}
