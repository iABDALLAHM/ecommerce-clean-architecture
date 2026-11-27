abstract class ConfirmPasswordState {}

final class InitialConfirmPasswordState extends ConfirmPasswordState {}

final class SuccessConfirmPasswordState extends ConfirmPasswordState {}

final class LoadingConfirmPasswordState extends ConfirmPasswordState {}

final class FailureConfirmPasswordState extends ConfirmPasswordState {
  final String errorMessage;

  FailureConfirmPasswordState({required this.errorMessage});
}
