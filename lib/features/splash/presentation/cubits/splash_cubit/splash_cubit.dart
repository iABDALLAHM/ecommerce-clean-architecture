import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/core/services/secure_storage_service/secure_storage_service.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/splash/presentation/cubits/splash_cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required SharedPrefService sharedPrefsService,
    required AuthRepository authRepository,
  }) : _sharedPrefsService = sharedPrefsService,
       _authRepository = authRepository,

       super(InitialState());

  final SharedPrefService _sharedPrefsService;
  final AuthRepository _authRepository;

  Future<void> checkUserStatus() async {
    await Future.delayed(Duration(seconds: 3));

    var isOnBoardingSeen = _sharedPrefsService.getBool(key: kOnBoardingSeen);

    if (isOnBoardingSeen) {
      _handleIfOnboardingSeen();
    } else {
      emit(NavigateToOnboardingScreenState());
    }
  }

  void _handleIfOnboardingSeen() async {
    var currentUserId = await _authRepository.getCurrentUserId();
    currentUserId.fold(
      (failure) {
        emit(NavigateToLoginScreenState());
      },
      (currentUserId) async {
        var userId = await getIt.get<SecureStorageService>().getData(
          key: SecureStorageService.keyUserId,
        );

        if (currentUserId == userId) {
          emit(NavigateToMainScreenState());
        } else {
          emit(NavigateToLoginScreenState());
        }
      },
    );
  }
}
