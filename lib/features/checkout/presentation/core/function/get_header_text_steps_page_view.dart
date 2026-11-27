import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

List<String> getHeaderTextStepsPageView(BuildContext context) {
  return [
    LocaleKeys.checkout_shippingStep.tr(context: context),
    LocaleKeys.checkout_addressStep.tr(context: context),
    LocaleKeys.checkout_paymentStep.tr(context: context),
    LocaleKeys.checkout_reviewStep.tr(context: context),
  ];
}
