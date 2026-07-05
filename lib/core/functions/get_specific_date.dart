import 'package:ecommerce_clean_architecture/core/functions/get_month.dart';

String getSpecificDate({required DateTime date}) {
  return "${date.day} ${getMonth(month: date.month)} , ${date.year}";
}
