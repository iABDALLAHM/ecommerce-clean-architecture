import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

String handleDateTime({required BuildContext context, required DateTime date}) {
  int hour = date.hour;
  String preiod = (date.hour < 12)
      ? LocaleKeys.time_morning.tr(context: context)
      : LocaleKeys.time_night.tr(context: context);

  return "$hour $preiod";
}
