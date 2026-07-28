import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({
    super.key,
    required this.iconName,
    required this.activeIcon,
  });
  final String iconName, activeIcon;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.tertiaryFixed,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset(activeIcon),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4, left: 7),
            child: Text(
              iconName,
              style: AppStyles.textStyle11SemiBold.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
