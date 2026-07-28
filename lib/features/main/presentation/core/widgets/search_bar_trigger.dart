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
    var colorScheme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: colorScheme.colorScheme.shadow,
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
          fillColor: colorScheme.scaffoldBackgroundColor,
          filled: true,
          contentPadding: EdgeInsets.zero,
          focusedBorder: buildOutlineInputBorder(
            color: colorScheme.colorScheme.surface,
          ),

          enabledBorder: buildOutlineInputBorder(
            color: colorScheme.colorScheme.surface,
          ),

          border: buildOutlineInputBorder(
            color: colorScheme.colorScheme.surface,
          ),

          hintText: LocaleKeys.home_searchingTextField.tr(),
          hintStyle: AppStyles.textStyle13Regular.copyWith(
            color: colorScheme.colorScheme.tertiaryContainer,
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

  OutlineInputBorder buildOutlineInputBorder({required Color color}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: color),
      );
}
