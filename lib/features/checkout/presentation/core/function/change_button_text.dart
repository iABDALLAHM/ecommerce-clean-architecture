import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';

String changeButtonText({required int currentPage}) {
  switch (currentPage) {
    case 0:
      return LocaleKeys.checkOut_shippingStepButton.tr();
    case 1:
      return LocaleKeys.checkOut_addressStepButton.tr();
    case 2:
      return LocaleKeys.checkOut_paymentStepButton.tr();
    case 3:
      return LocaleKeys.checkOut_reviewStepButton.tr();
    default:
      return "";
  }
}
