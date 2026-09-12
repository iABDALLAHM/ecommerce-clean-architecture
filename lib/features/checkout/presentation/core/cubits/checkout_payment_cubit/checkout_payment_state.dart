abstract class CheckoutPaymentState {}

final class InitialCheckoutPaymentState extends CheckoutPaymentState {}

final class SuccessCheckoutPaymentState extends CheckoutPaymentState {}

final class FailureCheckoutPaymentState extends CheckoutPaymentState {
  final String errorMessage;

  FailureCheckoutPaymentState({required this.errorMessage});
}

final class LoadingCheckoutPaymentState extends CheckoutPaymentState {}
