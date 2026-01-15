import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AddReviewTextField extends StatelessWidget {
  const AddReviewTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 15,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: Image.network(getUserData().userImage),
          ),
        ),
        hintText: "اكتب التعليق..",
        hintStyle: AppStyles.textStyle13Regular,
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Color(0xffEEEEEE)),
  );
}
