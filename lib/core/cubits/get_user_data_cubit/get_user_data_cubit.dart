import 'dart:developer';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit({
    required UserRepository userRepository,
    required SecureStorageRepository secureStorageRepository,
  }) : _userRepository = userRepository,
       _secureStorageRepository = secureStorageRepository,
       super(InitialGetUserDataState());

  final UserRepository _userRepository;
  final SecureStorageRepository _secureStorageRepository;

  Future getUserData() async {
    emit(LoadingGetUserDataState());

    var userId = await _secureStorageRepository.getData(key: keyUserId);

    var result = await _userRepository.getUserData(uId: userId);

    result.fold(
      (failure) {
        emit(FailureGetUserDataState(errorMessage: failure.message));
      },
      (result) {

        log("This is the UID in GetUserDataCubit ${result.uId}");

        emit(SuccessGetUserDataState(userEntity: result));
      },
    );
  }
}
