import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AddNewCardTextField extends StatelessWidget {
  const AddNewCardTextField({
    super.key,
    required this.hintText,
    required this.onSaved,
  });

  final String hintText;
  final Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "";
        }
        return null;
      },
      onSaved: onSaved,
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 0),
        hintText: hintText,
        hintStyle: AppStyles.textStyle13Bold.copyWith(color: Color(0xff949D9E)),
        filled: true,
        fillColor: Color(0xffE6E9EA),
        border: buildOutlineInputBorder(),
        errorBorder: buildOutlineInputBorder(color: Colors.red),
        focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color color = Colors.grey}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: color),
      );
}


