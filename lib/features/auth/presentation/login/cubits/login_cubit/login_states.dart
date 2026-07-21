abstract class LoginStates {}

final class InitialLoginState extends LoginStates {}

final class SuccessLoginState extends LoginStates {}

final class LoadingLoginState extends LoginStates {}

final class FailureLoginState extends LoginStates {
  final String errMessage;
  FailureLoginState({required this.errMessage});
}

final class LoadingLoginWithGoogleState extends LoginStates {}

final class SuccessLoginWithGoogleState extends LoginStates {}

final class FailureLoginWithGoogleState extends LoginStates {
  final String errorMessage;

  FailureLoginWithGoogleState({required this.errorMessage});
}



final class LoadingLoginWithFacebookState extends LoginStates {}

final class SuccessLoginWithFacebookState extends LoginStates {}

final class FailureLoginWithFacebookState extends LoginStates {
  final String errorMessage;

  FailureLoginWithFacebookState({required this.errorMessage});
}
