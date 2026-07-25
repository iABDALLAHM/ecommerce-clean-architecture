import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';

String handleExpirationYearsText({required int numOfYears}) {
  switch (numOfYears) {
    case 1:
      return LocaleKeys.itemDetails_itemDetailsExpireOneYear.tr();
    case 2:
      return LocaleKeys.itemDetails_itemDetailsExpireTwoYear.tr();
    case 3:
      return LocaleKeys.itemDetails_itemDetailsExpireThreeYear.tr();
    case 4:
      return LocaleKeys.itemDetails_itemDetailsExpireFourYear.tr();
    default:
      return "";
  }
}
