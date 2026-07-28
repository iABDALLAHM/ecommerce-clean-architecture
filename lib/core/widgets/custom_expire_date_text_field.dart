import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomExpireDateTextField extends StatelessWidget {
  const CustomExpireDateTextField({
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
      maxLength: 5,
      inputFormatters: [CardExpiryFormatter()],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: LocaleKeys.checkOut_paymentCardExpirationDate.tr(),
      ),
    );
  }
}

class CardExpiryFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll('/', '');

    if (text.length > 4) {
      text = text.substring(0, 4);
    }

    if (text.length > 2) {
      text = "${text.substring(0, 2)}/${text.substring(2)}";
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
