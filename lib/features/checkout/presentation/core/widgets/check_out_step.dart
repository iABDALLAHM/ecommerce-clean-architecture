import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CheckOutStep extends StatelessWidget {
  const CheckOutStep({
    super.key,
    required this.isSelected,
    required this.text,
    required this.stepIndex,
  });
  final bool isSelected;
  final String text;
  final int stepIndex;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          decoration: ShapeDecoration(
            color: isSelected ? colorScheme.primary : colorScheme.tertiaryFixed,
            shape: OvalBorder(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: isSelected
                ? Icon(Icons.check, color: colorScheme.onPrimary, size: 20)
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 1,
                    ),
                    child: Text(
                      "$stepIndex",
                      style: AppStyles.textStyle13SemiBold,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppStyles.textStyle13Bold.copyWith(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.tertiaryContainer,
          ),
        ),
      ],
    );
  }
}
