import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomCardHolderNameTextField extends StatelessWidget {
  const CustomCardHolderNameTextField({
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "";
        }
        return null;
      },
      onSaved: onSaved,
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 0),
        hintText: "اسم حامل البطاقه",
        hintStyle: AppStyles.textStyle13Bold.copyWith(color: Color(0xff949D9E)),
        filled: true,
        fillColor: Color(0xffF9FAFA),
        border: buildOutlineInputBorder(),
        errorBorder: buildOutlineInputBorder(color: Colors.red),
        focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({
    Color color = const Color(0xffE6E9EA),
  }) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: BorderSide(color: color, width: 1),
  );
}
