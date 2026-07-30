abstract class PaymentState {}

final class InitialPaymentState extends PaymentState {}

final class SuccessPaymentState extends PaymentState {}

final class FailurePaymentState extends PaymentState {
  final String errorMessage;

  FailurePaymentState({required this.errorMessage});
}

final class LoadingPaymentState extends PaymentState {}
