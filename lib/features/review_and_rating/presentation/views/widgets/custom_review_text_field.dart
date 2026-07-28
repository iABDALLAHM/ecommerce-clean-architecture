import 'package:easy_localization/easy_localization.dart';
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
      ),
    );
  }
}
