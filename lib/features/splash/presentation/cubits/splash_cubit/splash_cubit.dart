import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/core/repositories/local_storage_repository/local_storage_repository.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/splash/presentation/cubits/splash_cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required AuthRepository authRepository,
    required SecureStorageRepository secureStorageRepository,
    required LocalStorageRepository localStorageService,
  }) : _authRepository = authRepository,
       _secureStorageRepository = secureStorageRepository,
       _localStorageRepository = localStorageService,

       super(InitialState());

  final AuthRepository _authRepository;
  final SecureStorageRepository _secureStorageRepository;
  final LocalStorageRepository _localStorageRepository;

  Future<void> checkUserStatus() async {
    await Future.delayed(Duration(seconds: 3));

    var isOnBoardingSeen = await _localStorageRepository.getBoolean(
      key: kOnBoardingSeen,
    );

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
        var userId = await _secureStorageRepository.getData(key: keyUserId);

        if (currentUserId == userId) {
          emit(NavigateToMainScreenState());
        } else {
          emit(NavigateToLoginScreenState());
        }
      },
    );
  }
}
