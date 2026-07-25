import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SaveLocationSection extends StatefulWidget {
  const SaveLocationSection({super.key, required this.isSaveLocation});
  final ValueChanged<bool> isSaveLocation;
  @override
  State<SaveLocationSection> createState() => _SaveLocationSectionState();
}

class _SaveLocationSectionState extends State<SaveLocationSection> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          padding: EdgeInsets.zero,
          value: isActive,
          onChanged: (value) {
            setState(() {
              isActive = value;
            });
            widget.isSaveLocation(isActive);
          },
          activeTrackColor: AppColors.primaryColor,
          inactiveTrackColor: Colors.grey,
          inactiveThumbColor: Colors.white,
          activeThumbColor: Colors.white,
        ),
        const SizedBox(width: 8),
        Text(
          LocaleKeys.checkOut_saveAddressSwitch.tr(),
          style: AppStyles.textStyle13SemiBold.copyWith(
            color: Color(0xff949D9E),
          ),
        ),
      ],
    );
  }
}
