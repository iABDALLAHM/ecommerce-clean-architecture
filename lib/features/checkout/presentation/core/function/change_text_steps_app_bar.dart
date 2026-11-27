import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

String changeTextStepsAppBar({
  required BuildContext context,
  required int step,
}) {
  switch (step) {
    case 0:
      return LocaleKeys.checkout_shippingStep.tr(context: context);
    case 1:
      return LocaleKeys.checkout_addressStep.tr(context: context);
    case 2:
      return LocaleKeys.checkout_paymentStep.tr(context: context);
    case 3:
      return LocaleKeys.checkout_reviewStep.tr(context: context);
    default:
      return "unKnown";
  }
}
