import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNotificationProfileItem extends StatelessWidget {
  const CustomNotificationProfileItem({
    super.key,
    required this.icon,
    required this.name,
    required this.onPressed,
  });
  final String icon, name;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 7),
            Text(
              name,
              style: AppStyles.textStyle13SemiBold.copyWith(
                color: Color(0xff949D9E),
              ),
            ),
            Spacer(),
            Switch(value: true, onChanged: (change) {}),
          ],
        ),
        const SizedBox(height: 8),
        CustomDivider(),
      ],
    );
  }
}