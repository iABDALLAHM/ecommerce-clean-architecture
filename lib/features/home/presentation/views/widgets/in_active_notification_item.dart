import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveNotificationItem extends StatelessWidget {
  const InActiveNotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      trailing: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            "9 صباحا",
            style: AppStyles.textStyle13Regular.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
        ],
      ),
      leading: SvgPicture.asset(Assets.imagesNotificationImage),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "خصم ", style: AppStyles.textStyle13SemiBold),
                TextSpan(
                  text: "50% ",
                  style: AppStyles.textStyle16SemiBold.copyWith(
                    color: Color(0xffEB5757),
                  ),
                ),
                TextSpan(
                  text: "علي اسعار الفواكه بمناسبه العيد",
                  style: AppStyles.textStyle13SemiBold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
