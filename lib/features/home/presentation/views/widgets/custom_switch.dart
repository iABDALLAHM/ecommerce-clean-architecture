import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Switch(
        thumbColor: WidgetStateProperty.all(Colors.white),
        padding: EdgeInsets.zero,
        activeThumbColor: Colors.white,
        activeTrackColor: AppColors.primaryColor,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Color(0xff888FA0),
        value: isActive,
        onChanged: (change) {
          setState(() {
            isActive = !isActive;
          });
        },
      ),
    );
  }
}
