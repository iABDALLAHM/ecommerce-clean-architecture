import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';

List<String> getHeaderTextStepsPageView() {
  return [
    LocaleKeys.checkOut_shippingStep.tr(),
    LocaleKeys.checkOut_addressStep.tr(),
    LocaleKeys.checkOut_paymentStep.tr(),
    LocaleKeys.checkOut_reviewStep.tr(),
  ];
}
