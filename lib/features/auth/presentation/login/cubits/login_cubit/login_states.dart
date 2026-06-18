import 'package:ecommerce_clean_architecture/features/auth/auth.dart';

abstract class LoginStates {}

final class InitialLoginState extends LoginStates {}

final class SuccessLoginState extends LoginStates {
  final UserEntity userEntity;

  SuccessLoginState({required this.userEntity});
}

final class LoadingLoginState extends LoginStates {}

final class FailureLoginState extends LoginStates {
  final String errMessage;
  FailureLoginState({required this.errMessage});
}
