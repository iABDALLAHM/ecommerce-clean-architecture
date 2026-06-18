import 'package:ecommerce_clean_architecture/features/auth/data/repositories/auth_repository/auth_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/cubits/sign_out_cubit/sign_out_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutCubit extends Cubit<SignOutStates> {
  SignOutCubit({required this.authRepo}) : super(InitialSignOutState());

  final AuthRepository authRepo;

  Future<void> signout() async {
    emit(LoadingSignOutState());

    var result = await authRepo.signOut();

    result.fold(
      (failure) => emit(FailureSignOutState(errMessage: failure.message)),
      (successSignOut) => emit(SuccessSignOutState()),
    );
  }
}
