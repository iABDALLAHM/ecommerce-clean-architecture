import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchBarTrigger extends StatelessWidget {
  const HomeSearchBarTrigger({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        Navigator.of(context).pushNamed(SearchBody.routeName);
      },
      readOnly: true,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.zero,
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
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
