import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTermsAndConditionsButton extends StatelessWidget {
  const CustomTermsAndConditionsButton({super.key, required this.onChange});
  final ValueChanged<bool> onChange;
  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<TermsAndConditionsCubit>().state.isChecked;
    return GestureDetector(
      onTap: () {
        onChange(!isSelected);
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
              : const SizedBox(height: 20, width: 20),
        ),
      ),
    );
  }
}
