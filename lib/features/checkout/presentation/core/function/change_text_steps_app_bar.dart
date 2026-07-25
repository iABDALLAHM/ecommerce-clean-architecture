import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';

String changeTextStepsAppBar({required int step}) {
  switch (step) {
    case 0:
      return LocaleKeys.checkOut_shippingStep.tr();
    case 1:
      return LocaleKeys.checkOut_addressStep.tr();
    case 2:
      return LocaleKeys.checkOut_paymentStep.tr();
    case 3:
      return LocaleKeys.checkOut_reviewStep.tr();
    default:
      return "unKnown";
  }
}
