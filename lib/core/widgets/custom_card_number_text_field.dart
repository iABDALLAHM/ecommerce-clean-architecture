import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomCardNumberTextField extends StatelessWidget {
  const CustomCardNumberTextField({
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
      maxLength: 16,
      keyboardType: TextInputType.number,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: LocaleKeys.checkOut_paymentCardNumberTextField.tr(),
      ),
    );
  }
}
