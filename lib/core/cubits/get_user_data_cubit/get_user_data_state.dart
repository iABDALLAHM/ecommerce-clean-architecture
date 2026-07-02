import 'package:ecommerce_clean_architecture/features/auth/domain/entities/user_entities/user_entity.dart';

abstract class GetUserDataState {}

final class InitialGetUserDataState extends GetUserDataState {}

final class LoadingGetUserDataState extends GetUserDataState {}

final class SuccessGetUserDataState extends GetUserDataState {
  final UserEntity userEntity;

  SuccessGetUserDataState({required this.userEntity});
}

final class FailureGetUserDataState extends GetUserDataState {
  final String errorMessage;

  FailureGetUserDataState({required this.errorMessage});
}
