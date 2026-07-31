import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_email_cubit/update_user_email_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserEmailCubit extends Cubit<UpdateUserEmailState> {
  UpdateUserEmailCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,

      super(InitialUpdateUserEmailState());

  final AuthRepository _authRepository;

  Future updateEmail({
    required String newEmail,
    required String password,
  }) async {
    emit(LoadingUpdateUserEmailState());
    var result = await _authRepository.updateEmail(
      password: password,
      email: newEmail,
    );

    result.fold(
      (failure) {
        emit(FailureUpdateUserEmailState(errorMessage: failure.message));
      },
      (success) async {
        emit(SuccessUpdateUserEmailState());
      },
    );
  }
}
