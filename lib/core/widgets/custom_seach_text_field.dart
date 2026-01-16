import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.zero,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),
        hintText: "ابحث عن.......",
        hintStyle: AppStyles.textStyle13Regular.copyWith(
          color: Color(0xff949D9E),
        ),
        prefixIcon: SvgPicture.asset(
          fit: BoxFit.scaleDown,
          Assets.imagesSearchIconSvg,
        ),
        suffixIcon: SvgPicture.asset(
          Assets.imagesFilterSearchIcon,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: Colors.white),
  );
}
