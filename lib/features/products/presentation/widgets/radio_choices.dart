import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

enum RadioChoicesEnum { fromHighToLow, fromLowToHigh, alphabetical }

class RadioChoices extends StatefulWidget {
  const RadioChoices({super.key});

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
        choice = value;
        setState(() {});
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
              "السعر ( الأعلي الي الأقل )",
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
              'السعر ( الأقل الي الأعلي )',
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
              'الأبجديه',
              style: AppStyles.textStyle13Bold.copyWith(color: Colors.black),
            ),
            value: RadioChoicesEnum.alphabetical,
          ),
        ],
      ),
    );
  }
}
