import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_name_cubit/update_user_name_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserNameCubit extends Cubit<UpdateUserNameState> {
  UpdateUserNameCubit({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(InitialUpdateUserNameState());
  final UserRepository _userRepository;

  Future updateUserName({required UserEntity userEntity}) async {
    emit(LoadingUpdateUserNameState());
    var result = await _userRepository.updateUserData(userEntity: userEntity);

    result.fold(
      (failure) {
        emit(FailureUpdateUserNameState(errorMessage: failure.message));
      },
      (success) {
        emit(SuccessUpdateUserNameState());
      },
    );
  }
}
