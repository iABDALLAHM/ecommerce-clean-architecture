import 'dart:math';

String generateOrderNumber() {
  var random = Random();
  String number = '';

  for (int i = 0; i < 7; i++) {
    number += random.nextInt(10).toString();
  }

  return '$number#';
}
