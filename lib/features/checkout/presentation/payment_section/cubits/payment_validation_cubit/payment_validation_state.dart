abstract class PaymentValidationState {}

final class InitialPaymentValidationState extends PaymentValidationState {}

final class PaymentValidationDoneState extends PaymentValidationState {}

final class PaymentValidationFailureState extends PaymentValidationState {}
