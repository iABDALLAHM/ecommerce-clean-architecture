import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTermsAndConditionsButton extends StatefulWidget {
  const CustomTermsAndConditionsButton({super.key, required this.onChange});
  final ValueChanged<bool> onChange;
  @override
  State<CustomTermsAndConditionsButton> createState() =>
      _CustomTermsAndConditionsButtonState();
}

class _CustomTermsAndConditionsButtonState
    extends State<CustomTermsAndConditionsButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
        widget.onChange(isSelected);
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: Colors.transparent, width: 2)
              : Border.all(color: Color(0xffDDDFDF), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: isSelected
              ? Icon(Icons.check, size: 20, color: Colors.white)
              : Icon(null, size: 20),
        ),
      ),
    );
  }
}
