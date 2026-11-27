import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_widget.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomNotificationAppBar extends StatelessWidget {
  const CustomNotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomArrowWidget(),
        Spacer(),
        Text(
          LocaleKeys.notifications_notificationsPageAppBar.tr(context: context),
          style: AppStyles.textStyle19Bold.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
