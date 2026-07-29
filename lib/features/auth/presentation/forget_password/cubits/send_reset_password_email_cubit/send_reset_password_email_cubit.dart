import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/forget_password/cubits/send_reset_password_email_cubit/send_reset_password_email_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendResetPasswordEmailCubit extends Cubit<SendResetPasswordEmailState> {
  SendResetPasswordEmailCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(InitialSendEmailState());

  final AuthRepository _authRepository;

  Future sendResetEmail({required String email}) async {
    emit(LoadingSendEmailState());
    var result = await _authRepository.sendResetPasswordEmail(email: email);

    result.fold(
      (failure) {
        emit(FailureSendEmailState(errorMessage: failure.message));
      },
      (result) {
        emit(SuccessSendEmailState());
      },
    );
  }
}
