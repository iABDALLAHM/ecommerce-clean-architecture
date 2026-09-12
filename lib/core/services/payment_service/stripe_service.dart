import 'dart:convert';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton()
class StripeService {
  StripeService({required Stripe stripe}) : _stripe = stripe;
  final Stripe _stripe;

  Future<void> init() async {
    Stripe.publishableKey = kPublishableKey;
    await _stripe.applySettings();
  }

  Future<String?> createPaymentIntent({
    required int amount,
    required String currency,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          "Authorization":
              "Bearer sk_test_51TYSTBFtj5mILhHkSk6mEgJoYekKNOluCu1YCXBEVie7kQcCXuCcfYQ7vXKYqZ7rqGFHX2JGw9ZIwWKpPWEftWhm00ZMvWjPVg",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {"amount": amount.toString(), "currency": currency},
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["client_secret"];
      } else {
        throw CustomException(
          exceptionMeassge: "Stripe Error Body: ${response.body}",
        );
      }
    } catch (e) {
      throw CustomException(exceptionMeassge: "Network Error: $e");
    }
  }

  Future<void> pay({required double amount, required String currency}) async {
    try {
      await init();
      String clientSecret =
          await createPaymentIntent(
            amount: amount.toInt(),
            currency: currency,
          ) ??
          "";
      await _stripe.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "FruitsHub",
          style: ThemeMode.system,
        ),
      );
      await _stripe.presentPaymentSheet();

      final paymentIntent = await _stripe.retrievePaymentIntent(clientSecret);

      if (paymentIntent.status != PaymentIntentsStatus.Succeeded) {
        throw CustomException(exceptionMeassge: "الدفع لم يكتمل");
      }
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        throw CustomException(exceptionMeassge: "canceled");
      }
    } catch (e) {
      throw CustomException(exceptionMeassge: "Payment Error: $e");
    }
  }
}
