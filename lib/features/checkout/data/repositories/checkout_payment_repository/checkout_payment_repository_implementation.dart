import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/core/services/payment_service/stripe_service.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/checkout_payment_repository/checkout_payment_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CheckoutPaymentRepository)
class CheckoutPaymentRepositoryImplementation
    implements CheckoutPaymentRepository {
  CheckoutPaymentRepositoryImplementation({required this.stripeService});

  final StripeService stripeService;

  @override
  Future<Either<Failure, void>> payWith({
    required double amount,
    required String paymentMethod,
    required String currency,
  }) async {
    try {
      await stripeService.pay(amount: amount, currency: currency);
      return Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
