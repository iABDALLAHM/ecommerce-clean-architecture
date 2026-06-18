import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/repositories/user_repository/user_repository.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/entities/user_entities/user_entity.dart';
import 'package:ecommerce_clean_architecture/features/auth/data/repositories/auth_repository/auth_repository.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/register/cubits/register_cubit/register_states.dart';
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
