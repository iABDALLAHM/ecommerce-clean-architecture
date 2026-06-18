import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset(activeIcon),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4, left: 7),
            child: Text(
              iconName,
              style: AppStyles.textStyle11SemiBold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
