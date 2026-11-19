import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/get_month.dart';
import 'package:flutter/material.dart';

String getSpecificDate({
  required DateTime date,
  required BuildContext context,
}) {
  var languageCode = context.locale.languageCode;
  return "${date.day} ${languageCode == arabicLanguageCode ? getMonthInArabic(month: date.month) : getMonthInEnglish(month: date.month)} , ${date.year}";
}
