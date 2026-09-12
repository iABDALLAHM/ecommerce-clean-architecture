import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';

abstract class CheckoutPaymentRepository {
  Future<Either<Failure, void>> payWith({
    required double amount,
    required String paymentMethod,
    required String currency,
  });
}
