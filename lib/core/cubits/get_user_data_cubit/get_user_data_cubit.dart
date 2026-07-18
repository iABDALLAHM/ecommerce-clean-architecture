import 'dart:developer';

import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/core/services/secure_storage_service/secure_storage_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(InitialGetUserDataState());

  final UserRepository _userRepository;

  Future getUserData() async {
    emit(LoadingGetUserDataState());
    var userId = await getIt.get<SecureStorageService>().getData(
      key: SecureStorageService.keyUserId,
    );

    var result = await _userRepository.getUserData(uId: userId);

    result.fold((l) => emit(FailureGetUserDataState(errorMessage: l.message)), (
      s,
    ) {
      getIt.get<SharedPrefService>().saveData(key: "user-id", value: s.uId);
      log("This is the UID in GetUserDataCubit ${s.uId}");
      emit(SuccessGetUserDataState(userEntity: s));
    });
  }
}
