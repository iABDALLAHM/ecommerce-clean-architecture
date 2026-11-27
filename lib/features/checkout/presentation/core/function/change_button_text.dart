import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

String changeButtonText({
  required BuildContext context,
  required int currentPage,
}) {
  switch (currentPage) {
    case 0:
      return LocaleKeys.checkout_shippingStepButton.tr(context: context);
    case 1:
      return LocaleKeys.checkout_addressStepButton.tr(context: context);
    case 2:
      return LocaleKeys.checkout_paymentStepButton.tr(context: context);
    case 3:
      return LocaleKeys.checkout_reviewStepButton.tr(context: context);
    default:
      return "";
  }
}
