abstract class UpdateUserEmailState {}

final class InitialUpdateUserEmailState extends UpdateUserEmailState {}

final class SuccessUpdateUserEmailState extends UpdateUserEmailState {}

final class FailureUpdateUserEmailState extends UpdateUserEmailState {
  final String errorMessage;

  FailureUpdateUserEmailState({required this.errorMessage});
}

final class LoadingUpdateUserEmailState extends UpdateUserEmailState {}
