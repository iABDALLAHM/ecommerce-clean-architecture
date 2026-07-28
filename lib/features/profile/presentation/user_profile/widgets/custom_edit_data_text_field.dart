import 'package:flutter/material.dart';

class CustomEditDataTextField extends StatelessWidget {
  const CustomEditDataTextField({
    super.key,
    required this.hintText,
    required this.onPressed,
  });
  final String hintText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: onPressed, icon: Icon(Icons.edit)),
        hintText: hintText,
      ),
    );
  }
}
