import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomCVVCardNumberTextField extends StatelessWidget {
  const CustomCVVCardNumberTextField({
    super.key,
    required this.onSaved,
    this.controller,
  });

  final Function(String?) onSaved;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      onSaved: onSaved,
      maxLength: 3,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: LocaleKeys.checkOut_paymentCardCVVNumber.tr(),
      ),
    );
  }
}
