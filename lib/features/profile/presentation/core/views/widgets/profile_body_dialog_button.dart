import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileBodyDialogButton extends StatelessWidget {
  const ProfileBodyDialogButton({
    super.key,
    required this.hintText,
    required this.onPressed,
    required this.isPrimary,
  });
  final String hintText;
  final Function() onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isPrimary
            ? colorScheme.primary
            : colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colorScheme.primary, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        hintText,
        style: AppStyles.textStyle16Bold.copyWith(
          color: isPrimary ? colorScheme.surface : colorScheme.primary,
        ),
      ),
    );
  }
}
