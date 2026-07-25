import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/enums/radio_enum_choices/radio_enum_choices.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class RadioChoices extends StatefulWidget {
  const RadioChoices({super.key, required this.onChange});
  final ValueChanged<RadioChoicesEnum?> onChange;
  @override
  State<RadioChoices> createState() => _RadioChoicesState();
}

class _RadioChoicesState extends State<RadioChoices> {
  RadioChoicesEnum? choice = RadioChoicesEnum.alphabetical;

  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      groupValue: choice,
      onChanged: (value) {
        setState(() {
          choice = value;
        });
        widget.onChange(choice);
      },
      child: Column(
        children: [
          RadioListTile(
            contentPadding: EdgeInsets.zero,

            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.primaryColor;
              }
              return Color(0xff949D9E);
            }),
            activeColor: AppColors.primaryColor,
            title: Text(
              LocaleKeys.home_sortByPriceFromHighToLow.tr(),
              style: AppStyles.textStyle13Bold.copyWith(color: Colors.black),
            ),
            value: RadioChoicesEnum.fromHighToLow,
          ),

          RadioListTile(
            contentPadding: EdgeInsets.zero,

            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.primaryColor;
              }
              return Color(0xff949D9E);
            }),
            activeColor: AppColors.primaryColor,
            title: Text(
              LocaleKeys.home_sortByPriceFromLowToHigh.tr(),
              style: AppStyles.textStyle13Bold.copyWith(color: Colors.black),
            ),
            value: RadioChoicesEnum.fromLowToHigh,
          ),

          RadioListTile(
            contentPadding: EdgeInsets.zero,
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.primaryColor;
              }
              return Color(0xff949D9E);
            }),
            activeColor: AppColors.primaryColor,
            title: Text(
              LocaleKeys.home_sortByAlphabetical.tr(),
              style: AppStyles.textStyle13Bold.copyWith(color: Colors.black),
            ),
            value: RadioChoicesEnum.alphabetical,
          ),
        ],
      ),
    );
  }
}
