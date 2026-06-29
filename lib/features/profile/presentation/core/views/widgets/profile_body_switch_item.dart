import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_divider.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBodySwitchItem extends StatelessWidget {
  const ProfileBodySwitchItem({
    super.key,
    required this.icon,
    required this.name,
    required this.onChange,
  });

  final String icon, name;
  final ValueChanged<bool> onChange;
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
            CustomSwitch(),
          ],
        ),
        const SizedBox(height: 8),
        CustomDivider(),
      ],
    );
  }
}
