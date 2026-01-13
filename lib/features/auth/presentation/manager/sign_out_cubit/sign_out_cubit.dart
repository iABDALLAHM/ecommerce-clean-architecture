import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/sign_out_cubit/sign_out_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutCubit extends Cubit<SignOutStates> {
  SignOutCubit({required this.authRepo}) : super(InitialSignOutState());
  final AuthRepo authRepo;

  Future<void> signout() async {
    emit(LoadingSignOutState());
    try {
      await authRepo.signOut();
      emit(SuccessSignOutState());
    } catch (e) {
      emit(FailureSignOutState());
    }
  }
}
