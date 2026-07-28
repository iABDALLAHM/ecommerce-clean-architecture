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
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.surface, width: 1),
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
                        color: colorScheme.surfaceBright,
                      ),
                    ),
                    TextSpan(
                      text: title,
                      style: AppStyles.textStyle16Bold.copyWith(
                        color: colorScheme.primaryFixed,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subTitle,
                style: AppStyles.textStyle13SemiBold.copyWith(
                  color: colorScheme.surfaceBright,
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
