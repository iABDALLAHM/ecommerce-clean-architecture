import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class NotificationBodyHeader extends StatelessWidget {
  const NotificationBodyHeader({
    super.key,
    required this.notificationLength,
  });

  final int notificationLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            LocaleKeys.notification_newNotificationsText.tr(),
            style: AppStyles.textStyle16Bold,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7),
          decoration: ShapeDecoration(
            color: Color(0xffEBF9F1),
            shape: OvalBorder(),
          ),
          child: Text(
            "$notificationLength",
            style: AppStyles.textStyle13Bold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            LocaleKeys.notification_allNotificationsSeen.tr() ,
            style: AppStyles.textStyle13Regular.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
        ),
      ],
    );
  }
}
