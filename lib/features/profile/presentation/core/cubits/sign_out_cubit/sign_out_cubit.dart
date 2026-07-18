import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/core/services/secure_storage_service/secure_storage_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/sign_out_cubit/sign_out_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutCubit extends Cubit<SignOutStates> {
  SignOutCubit({required this.authRepo}) : super(InitialSignOutState());

  final AuthRepository authRepo;

  Future signout() async {
    emit(LoadingSignOutState());

    var result = await authRepo.signOut();

    result.fold(
      (failure) => emit(FailureSignOutState(errMessage: failure.message)),
      (successSignOut) async {
        await getIt.get<SecureStorageService>().clearAll();
        await getIt.get<SharedPrefService>().clearDate();
        emit(SuccessSignOutState());
      },
    );
  }
}
