abstract class SavePaymentState {}

final class InitialSavePaymentState extends SavePaymentState {}

final class SuccessSavePaymentState extends SavePaymentState {}

final class FailureSavePaymentState extends SavePaymentState {
  final String errorMessage;

  FailureSavePaymentState({required this.errorMessage});
}

final class LoadingSavePaymentState extends SavePaymentState {}
