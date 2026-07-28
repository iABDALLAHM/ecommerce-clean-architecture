import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class MakeCardAsDefault extends StatefulWidget {
  const MakeCardAsDefault({super.key, required this.onChange});
  final ValueChanged<bool> onChange;
  @override
  State<MakeCardAsDefault> createState() => _MakeCardAsDefaultState();
}

class _MakeCardAsDefaultState extends State<MakeCardAsDefault> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            isSelected = !isSelected;
            setState(() {});
            widget.onChange(!isSelected);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? colorScheme.primary : colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: Colors.transparent, width: 2)
                  : Border.all(width: 2, color: colorScheme.tertiary),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: isSelected
                  ? Icon(Icons.check, size: 20, color: colorScheme.surface)
                  : const SizedBox(height: 20, width: 20),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          LocaleKeys.profile_addNewPaymentMakeCardDefault.tr(),
          style: AppStyles.textStyle13SemiBold.copyWith(
            color: colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
