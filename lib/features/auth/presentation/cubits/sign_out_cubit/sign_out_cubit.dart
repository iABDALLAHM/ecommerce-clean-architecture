import 'package:ecommerce_clean_architecture/features/auth/data/repos/auth_repository/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/cubits/sign_out_cubit/sign_out_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutCubit extends Cubit<SignOutStates> {
  SignOutCubit({required this.authRepo}) : super(InitialSignOutState());

  final AuthRepo authRepo;

  Future<void> signout() async {
    emit(LoadingSignOutState());

    var result = await authRepo.signOut();

    result.fold(
      (failure) => emit(FailureSignOutState(errMessage: failure.message)),
      (successSignOut) => emit(SuccessSignOutState()),
    );
  }
}
