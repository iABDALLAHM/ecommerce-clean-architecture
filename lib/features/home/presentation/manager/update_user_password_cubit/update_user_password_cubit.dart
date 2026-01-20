import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/update_user_password_cubit/update_user_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserPasswordCubit extends Cubit<UpdateUserPasswordStates> {
  UpdateUserPasswordCubit({required this.authRepo})
    : super(InitialUpdateUserPasswordState());
  final AuthRepo authRepo;

  Future<void> updateUserPassword({required String newPassword}) async {
    emit(LoadingUpdateUserPasswordState());
    var result = await authRepo.updatePassword(newPassword: newPassword);
    result.fold(
      (failure) {
        emit(FailureUpdateUserPasswordState(errMessage: failure.message));
      },
      (success) {
        emit(SuccessUpdateUserPasswordState());
      },
    );
  }
}
