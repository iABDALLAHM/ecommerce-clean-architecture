import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchBarTrigger extends StatelessWidget {
  const SearchBarTrigger({super.key, required this.fromRoute});
  final String fromRoute;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(20, 0, 0, 0),
            offset: Offset(0, 3),
            spreadRadius: 0,
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        onTap: () {
          context.go("$fromRoute${AppRoutes.search}");
        },
        readOnly: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.zero,
          focusedBorder: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          border: buildOutlineInputBorder(),
          hintText: LocaleKeys.home_searchingTextField.tr(),
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
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: Colors.white),
  );
}
