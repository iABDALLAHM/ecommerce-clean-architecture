import 'dart:convert';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/services/payment_service/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: PaymentService)
class StripeService implements PaymentService {
  StripeService({required Stripe stripe}) : _stripe = stripe;
  final Stripe _stripe;
  @override
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
          "Authorization": "Bearer $kSecretKey",
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

  @override
  Future<void> pay({required int amount, required String currency}) async {
    try {
      await init();
      final clientSecret = await createPaymentIntent(
        amount: amount,
        currency: currency,
      );
      await _stripe.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "FruitsHub",
          style: ThemeMode.system,
        ),
      );
      await _stripe.presentPaymentSheet();
    } on StripeException catch (e) {
      throw CustomException(
        exceptionMeassge: "Stripe SDK Error: ${e.error.localizedMessage}",
      );
    } catch (e) {
      throw CustomException(exceptionMeassge: "Payment Error: $e");
    }
  }
}
