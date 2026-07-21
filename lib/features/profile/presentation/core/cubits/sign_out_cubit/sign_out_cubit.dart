import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/core/repositories/local_storage_repository/local_storage_repository.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/sign_out_cubit/sign_out_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutCubit extends Cubit<SignOutStates> {
  SignOutCubit({
    required this.authRepo,
    required SecureStorageRepository secureStorageRepository,
    required LocalStorageRepository localStorageRepository,
  }) : _secureStorageRepository = secureStorageRepository,
       _localStorageRepository = localStorageRepository,
       super(InitialSignOutState());

  final AuthRepository authRepo;
  final SecureStorageRepository _secureStorageRepository;
  final LocalStorageRepository _localStorageRepository;

  Future signout() async {
    emit(LoadingSignOutState());

    var result = await authRepo.signOut();

    result.fold(
      (failure) => emit(FailureSignOutState(errMessage: failure.message)),
      (successSignOut) async {
        await _secureStorageRepository.clearAll();
        await _localStorageRepository.clearData();
        emit(SuccessSignOutState());
      },
    );
  }
}
