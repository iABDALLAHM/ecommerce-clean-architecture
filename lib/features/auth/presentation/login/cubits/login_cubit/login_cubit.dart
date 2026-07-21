import 'dart:developer';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  final AuthRepository authRepo;
  final UserRepository userRepo;
  final SecureStorageRepository _secureStorageRepository;

  LoginCubit({
    required this.authRepo,
    required this.userRepo,
    required SecureStorageRepository secureStorageRepository,
  }) : _secureStorageRepository = secureStorageRepository,

       super(InitialLoginState());

  Future signIn({required String email, required String password}) async {
    emit(LoadingLoginState());

    var userID = await authRepo.signIn(email: email, password: password);

    userID.fold(
      (failure) {
        emit(FailureLoginState(errMessage: failure.message));
      },
      (resultId) async {
        await _secureStorageRepository.saveData(
          key: keyUserId,
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
            await _secureStorageRepository.saveData(
              key: keyUserId,
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
            await _secureStorageRepository.saveData(
              key: keyUserId,
              value: userEntity.uId,
            );
            emit(SuccessLoginWithFacebookState());
          },
        );
      },
    );
  }
}
