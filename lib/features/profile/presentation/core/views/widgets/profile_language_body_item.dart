import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileLanguageBodyItem extends StatelessWidget {
  const ProfileLanguageBodyItem({
    super.key,
    required this.icon,
    required this.name,
    required this.onPressed,
    required this.currentLang,
  });
  final String icon, name;
  final Function() onPressed;
  final String currentLang;

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
            Text(
              currentLang == "ar" ? "العربية" : "English",
              style: AppStyles.textStyle13Regular,
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onPressed,
              child: RotatedBox(
                quarterTurns: 2,
                child: Icon(Icons.arrow_back_ios_new, size: 20),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomDivider(),
      ],
    );
  }
}
