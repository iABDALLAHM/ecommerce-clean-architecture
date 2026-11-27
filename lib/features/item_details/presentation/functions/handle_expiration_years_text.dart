import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

String handleExpirationYearsText({
  required BuildContext context,
  required int numOfYears,
}) {
  switch (numOfYears) {
    case 1:
      return LocaleKeys.itemDetails_itemDetailsExpireOneYear.tr(
        context: context,
      );
    case 2:
      return LocaleKeys.itemDetails_itemDetailsExpireTwoYear.tr(
        context: context,
      );
    case 3:
      return LocaleKeys.itemDetails_itemDetailsExpireThreeYear.tr(
        context: context,
      );
    case 4:
      return LocaleKeys.itemDetails_itemDetailsExpireFourYear.tr(
        context: context,
      );
    default:
      return "";
  }
}
