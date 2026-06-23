import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoDetailsBox extends StatelessWidget {
  const InfoDetailsBox({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.titleDetails,
  });
  final String icon, title, subTitle;
  final String? titleDetails;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffF1F1F5), width: 1),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: titleDetails,
                      style: AppStyles.textStyle16Bold.copyWith(
                        color: Color(0xff979899),
                      ),
                    ),
                    TextSpan(
                      text: title,
                      style: AppStyles.textStyle16Bold.copyWith(
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subTitle,
                style: AppStyles.textStyle13SemiBold.copyWith(
                  color: Color(0xff979899),
                ),
              ),
              const SizedBox(width: 18),
            ],
          ),
          Spacer(),
          SvgPicture.asset(icon),
        ],
      ),
    );
  }
}
