import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onSaved,
    this.textInputType = TextInputType.text,
    this.controller,
  });
  final String hintText;
  final Function(String?) onSaved;
  final TextInputType textInputType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
