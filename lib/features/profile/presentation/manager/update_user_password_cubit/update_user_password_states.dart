abstract class UpdateUserPasswordStates {}

class InitialUpdateUserPasswordState extends UpdateUserPasswordStates {}

class SuccessUpdateUserPasswordState extends UpdateUserPasswordStates {}

class LoadingUpdateUserPasswordState extends UpdateUserPasswordStates {}

class FailureUpdateUserPasswordState extends UpdateUserPasswordStates {
  final String errMessage;

  FailureUpdateUserPasswordState({required this.errMessage});
}
