import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AuthRichText extends StatelessWidget {
  const AuthRichText({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStyles.textStyle16SemiBold.copyWith(
            color: colorScheme.tertiaryContainer,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            " $subTitle",
            style: AppStyles.textStyle16SemiBold.copyWith(
              color: colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
