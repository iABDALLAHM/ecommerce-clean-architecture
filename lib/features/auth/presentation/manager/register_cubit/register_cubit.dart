import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.authRepo}) : super(InitialRegisterState());
  final AuthRepo authRepo;
  Future register({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(LoadingRegisterState());
    var result = await authRepo.createNewAccount(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(FailureRegisterState(errMessage: failure.message)),
      (success) => emit(SuccessRegisterState()),
    );
  }
}
