import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomCardNumberTextField extends StatelessWidget {
  const CustomCardNumberTextField({super.key, required this.onSaved, this.controller});

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
        errorStyle: TextStyle(fontSize: 0),
        filled: true,
        fillColor: Color(0xffF9FAFA),
        hintText: "رقم البطاقة",
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