import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBodySwitchItem extends StatelessWidget {
  const ProfileBodySwitchItem({
    super.key,
    required this.icon,
    required this.name,
    required this.value,
    required this.onChange,
  });

  final bool value;
  final ValueChanged<bool> onChange;
  final String icon, name;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 7),
            Text(
              name,
              style: AppStyles.textStyle13SemiBold.copyWith(
                color: colorScheme.tertiaryContainer,
              ),
            ),
            Spacer(),
            Switch(value: value, onChanged: onChange),
          ],
        ),
        const SizedBox(height: 8),
        CustomDivider(),
      ],
    );
  }
}
