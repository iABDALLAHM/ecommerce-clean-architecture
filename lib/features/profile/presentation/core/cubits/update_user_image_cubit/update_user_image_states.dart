abstract class UpdateUserImageStates {}

final class InitialUpdateUserImageState extends UpdateUserImageStates {}

final class SuccessUpdateUserImageState extends UpdateUserImageStates {}

final class FailureUpdateUserImageState extends UpdateUserImageStates {
  final String errMessage;

  FailureUpdateUserImageState({required this.errMessage});
}

final class LoadingUpdateUserImageState extends UpdateUserImageStates {}
