import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomEditDataTextField extends StatelessWidget {
  const CustomEditDataTextField({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {},
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.edit, color: Color(0xff949D9E)),
        hintText: hintText,
        hintStyle: AppStyles.textStyle13Bold.copyWith(color: Color(0xff949D9E)),
        fillColor: Color(0xffF9FAFA),
        filled: true,
        border: _buildOutLineInputBorder(),
        enabledBorder: _buildOutLineInputBorder(),
        focusedBorder: _buildOutLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutLineInputBorder() =>
      OutlineInputBorder(borderSide: BorderSide(color: Color(0xffE6E9EA)));
}
