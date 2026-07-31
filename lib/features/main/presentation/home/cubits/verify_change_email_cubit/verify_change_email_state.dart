abstract class VerifyChangeEmailState {}

final class InitialVerifyChangeEmailState extends VerifyChangeEmailState {}

final class LoadingVerifyChangeEmailState extends VerifyChangeEmailState {}

final class SuccessVerifyChangeEmailState extends VerifyChangeEmailState {}

final class FailureVerifyChangeEmailState extends VerifyChangeEmailState {
  final String errorMessage;

  FailureVerifyChangeEmailState({required this.errorMessage});
}
