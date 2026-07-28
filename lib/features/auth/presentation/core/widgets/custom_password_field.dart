import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved, this.hintText});
  final Function(String?)? onSaved;
  final String? hintText;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      obscureText: isVisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            isVisible = !isVisible;
            setState(() {});
          },
          child: isVisible
              ? Icon(Icons.visibility_off)
              : Icon(Icons.remove_red_eye),
        ),
        hintText: LocaleKeys.auth_loginPage_passwordTextField.tr(),
      ),
    );
  }
}
