abstract class UpdateUserNameState {}

final class SuccessUpdateUserNameState extends UpdateUserNameState {}

final class LoadingUpdateUserNameState extends UpdateUserNameState {}

final class FailureUpdateUserNameState extends UpdateUserNameState {
  final String errorMessage;

  FailureUpdateUserNameState({required this.errorMessage});
}

final class InitialUpdateUserNameState extends UpdateUserNameState {}
