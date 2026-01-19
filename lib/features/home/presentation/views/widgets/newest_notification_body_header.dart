import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/widgets.dart';

class NewestNotificationBodyHeader extends StatelessWidget {
  const NewestNotificationBodyHeader({super.key, required this.notificationLength});
  final int notificationLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text("جديد", style: AppStyles.textStyle16Bold),
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
        Text(
          "تحديد الكل مقروء",
          style: AppStyles.textStyle13Regular.copyWith(
            color: Color(0xff949D9E),
          ),
        ),
      ],
    );
  }
}
