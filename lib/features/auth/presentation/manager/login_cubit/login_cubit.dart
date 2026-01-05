import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/login_cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.authRepo}) : super(InitialLoginState());
  AuthRepo authRepo;
  Future signIn({required String email, required String password}) async {
    emit(LoadingLoginState());
    var result = await authRepo.signIn(email: email, password: password);
    result.fold(
      (failure) => emit(FailureLoginState(errMessage: failure.message)),
      (success) => emit(SuccessLoginState()),
    );
  }
}
