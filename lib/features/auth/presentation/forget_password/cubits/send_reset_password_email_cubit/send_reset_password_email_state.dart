abstract class SendResetPasswordEmailState {}

final class SuccessSendEmailState extends SendResetPasswordEmailState {}

final class LoadingSendEmailState extends SendResetPasswordEmailState {}

final class FailureSendEmailState extends SendResetPasswordEmailState {
  final String errorMessage;

  FailureSendEmailState({required this.errorMessage});
}

final class InitialSendEmailState extends SendResetPasswordEmailState {}
