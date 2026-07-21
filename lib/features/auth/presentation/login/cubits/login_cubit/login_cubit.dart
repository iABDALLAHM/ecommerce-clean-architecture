import 'dart:developer';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/secure_storage_service/secure_storage_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  final AuthRepository authRepo;
  final UserRepository userRepo;

  LoginCubit({required this.authRepo, required this.userRepo})
    : super(InitialLoginState());

  Future signIn({required String email, required String password}) async {
    emit(LoadingLoginState());

    var userID = await authRepo.signIn(email: email, password: password);

    userID.fold(
      (failure) {
        emit(FailureLoginState(errMessage: failure.message));
      },
      (resultId) async {
        await getIt.get<SecureStorageService>().saveData(
          key: SecureStorageService.keyUserId,
          value: resultId,
        );

        log("This is the UID in login $resultId");
        emit(SuccessLoginState());
      },
    );
  }

  Future signInWithGoogle() async {
    emit(LoadingLoginWithGoogleState());
    var result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) {
        emit(FailureLoginWithGoogleState(errorMessage: failure.message));
      },
      (userEntity) async {
        var result = await userRepo.addUserData(userEntity: userEntity);

        result.fold(
          (failure) {
            emit(FailureLoginWithGoogleState(errorMessage: failure.message));
          },
          (result) async {
            await getIt.get<SecureStorageService>().saveData(
              key: SecureStorageService.keyUserId,
              value: userEntity.uId,
            );
            emit(SuccessLoginWithGoogleState());
          },
        );
      },
    );
  }

  Future signInWithFacebook() async {
    emit(LoadingLoginWithFacebookState());
    var result = await authRepo.signInWithFacebook();

    result.fold(
      (failure) {
        emit(FailureLoginWithFacebookState(errorMessage: failure.message));
      },
      (userEntity) async {
        var result = await userRepo.addUserData(userEntity: userEntity);

        result.fold(
          (failure) {
            emit(FailureLoginWithFacebookState(errorMessage: failure.message));
          },
          (result) async {
            await getIt.get<SecureStorageService>().saveData(
              key: SecureStorageService.keyUserId,
              value: userEntity.uId,
            );
            emit(SuccessLoginWithFacebookState());
          },
        );
      },
    );
  }
}
