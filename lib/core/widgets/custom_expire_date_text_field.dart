import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
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
        errorStyle: TextStyle(fontSize: 0),
        filled: true,
        fillColor: Color(0xffF9FAFA),
        hintText: "تاريخ الصلاحيه",
        hintStyle: AppStyles.textStyle13Bold.copyWith(color: Color(0xff949D9E)),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        errorBorder: buildOutlineInputBorder(color: Colors.red),
        focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({
    Color color = const Color(0xffE6E9EA),
  }) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: color, width: 1),
  );
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
