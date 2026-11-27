import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/reset_password/cubits/confirm_reset_password_cubit/confirm_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConfirmPasswordCubit extends Cubit<ConfirmPasswordState> {
  ConfirmPasswordCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(InitialConfirmPasswordState());

  final AuthRepository _authRepository;

  Future confirmPassword({
    required String newPassword,
    required String code,
  }) async {
    emit(LoadingConfirmPasswordState());
    var result = await _authRepository.confirmationPassword(
      newPassword: newPassword,
      code: code,
    );

    result.fold(
      (failure) {
        emit(FailureConfirmPasswordState(errorMessage: failure.message));
      },
      (success) {
        emit(SuccessConfirmPasswordState());
      },
    );
  }
}
