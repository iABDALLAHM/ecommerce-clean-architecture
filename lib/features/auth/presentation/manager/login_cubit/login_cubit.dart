import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/repos/user_repo/user_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/login_cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  final AuthRepo authRepo;
  final UserRepo userRepo;
  LoginCubit({required this.authRepo, required this.userRepo})
    : super(InitialLoginState());

  Future signIn({required String email, required String password}) async {
    emit(LoadingLoginState());

    var userID = await authRepo.signIn(email: email, password: password);

    userID.fold(
      (failure) {
        emit(FailureLoginState(errMessage: failure.message));
      },
      (userId) async {
        var userEntity = await userRepo.getUserData(uId: userId);

        userEntity.fold(
          (failure) {
            emit(FailureLoginState(errMessage: failure.message));
          },
          (userEntity) async {
            await getIt.get<SharedPrefService>().setBool(
              key: kIsUserSignIn,
              value: true,
            );
            emit(SuccessLoginState(userEntity: userEntity));
          },
        );
      },
    );
  }
}
