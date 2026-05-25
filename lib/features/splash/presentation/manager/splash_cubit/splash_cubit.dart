import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/services/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/features/splash/presentation/manager/splash_cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.sharedPrefsService}) : super(InitialState());

  final SharedPrefService sharedPrefsService;

  Future<void> checkUserStatus() async {
    await Future.delayed(Duration(seconds: 3));

    var isOnBoardingSeen = sharedPrefsService.getBool(key: kOnBoardingSeen);

    if (isOnBoardingSeen) {
      handleIfOnboardingSeen();
    } else {
      emit(NavigateToOnboardingScreenState());
    }
  }

  void handleIfOnboardingSeen() {
    var isUserLogin = sharedPrefsService.getBool(key: kIsUserSignIn);
    if (isUserLogin) {
      emit(NavigateToMainScreenState());
    } else {
      emit(NavigateToLoginScreenState());
    }
  }
}
