import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';

String handleDateTime({required DateTime date}) {
  int hour = date.hour;
  String preiod = (date.hour < 12)
      ? LocaleKeys.time_morning.tr()
      : LocaleKeys.time_night.tr();

  return "$hour $preiod";
}
