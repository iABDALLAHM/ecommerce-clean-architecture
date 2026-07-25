import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomReviewTextField extends StatelessWidget {
  const CustomReviewTextField({super.key, this.onSaved});
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: LocaleKeys.reviewAndRating_reviewAndRatingAddReviewTextField
            .tr(),
        errorStyle: TextStyle(fontSize: 0),
        focusedErrorBorder: _buildOutlineInputBorder(color: Colors.red),
        hintStyle: AppStyles.textStyle13Regular.copyWith(color: Colors.black),
        fillColor: Colors.white,
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        errorBorder: _buildOutlineInputBorder(color: Colors.red),
        border: _buildOutlineInputBorder(),
        disabledBorder: _buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder({Color color = Colors.grey}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: color, width: 2),
      );
}
