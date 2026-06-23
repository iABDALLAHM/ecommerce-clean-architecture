import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.authRepo, required this.userRepo})
    : super(InitialRegisterState());

  final AuthRepository authRepo;
  final UserRepository userRepo;

  Future register({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(LoadingRegisterState());

    var user = await authRepo.createNewAccount(
      email: email,
      password: password,
    );

    user.fold(
      (failure) {
        emit(FailureRegisterState(errMessage: failure.message));
      },
      (userId) async {
        final UserEntity userEntity = UserEntity(
          email: email,
          userImage: kDefaultUserImageUrl,
          uId: userId,
          name: name,
        );

        var result = await userRepo.addUserData(userEntity: userEntity);

        result.fold(
          (failure) {
            authRepo.deleteCurrentUser();
            emit(FailureRegisterState(errMessage: failure.message));
          },
          (success) {
            emit(SuccessRegisterState());
          },
        );
      },
    );
  }
}
