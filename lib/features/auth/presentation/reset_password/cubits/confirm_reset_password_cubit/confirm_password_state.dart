abstract class ConfirmPasswordState {}

final class InitialConfirmPasswordSate extends ConfirmPasswordState {}

final class SuccessConfirmPasswordSate extends ConfirmPasswordState {}

final class LoadingConfirmPasswordSate extends ConfirmPasswordState {}

final class FailureConfirmPasswordSate extends ConfirmPasswordState {
  final String errorMessage;

  FailureConfirmPasswordSate({required this.errorMessage});
}
