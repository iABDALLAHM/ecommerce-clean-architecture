import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/verify_change_email_cubit/verify_change_email_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyChangeEmailCubit extends Cubit<VerifyChangeEmailState> {
  VerifyChangeEmailCubit({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  }) : _authRepository = authRepository,
       super(InitialVerifyChangeEmailState());

  final AuthRepository _authRepository;

  Future<void> confirmChangeEmail({required String code}) async {
    emit(LoadingVerifyChangeEmailState());
    var result = await _authRepository.confirmChangeEmail(code: code);
    result.fold(
      (failure) {
        emit(FailureVerifyChangeEmailState(errorMessage: failure.message));
      },
      (newEmail) {
        emit(SuccessVerifyChangeEmailState());
      },
    );
  }
}
