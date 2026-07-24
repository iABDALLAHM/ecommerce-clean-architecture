import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SelectedLanguageWidget extends StatelessWidget {
  const SelectedLanguageWidget({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  final String language;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 59,
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 3,
              color: isSelected == true
                  ? AppColors.lightPrimaryColor
                  : Colors.grey,
            ),
          ),
          child: Center(
            child: Text(language, style: AppStyles.textStyle16SemiBold),
          ),
        ),
      ),
    );
  }
}
