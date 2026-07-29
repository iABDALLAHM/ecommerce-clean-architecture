import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_email_cubit/update_user_email_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserEmailCubit extends Cubit<UpdateUserEmailState> {
  UpdateUserEmailCubit({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  }) : _authRepository = authRepository,
       _userRepository = userRepository,
       super(InitialUpdateUserEmailState());

  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  Future updateEmail({
    required String newEmail,
    required String password,
    required UserEntity userEntity,
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
        final UserEntity updatedUserEntityDate = UserEntity(
          name: userEntity.name,
          email: newEmail,
          uId: userEntity.uId,
          userImage: userEntity.userImage,
        );

        var result = await _userRepository.updateUserData(
          userEntity: updatedUserEntityDate,
        );
        result.fold(
          (failure) {
            emit(FailureUpdateUserEmailState(errorMessage: failure.message));
          },
          (success) {
            emit(SuccessUpdateUserEmailState());
          },
        );
      },
    );
  }
}
