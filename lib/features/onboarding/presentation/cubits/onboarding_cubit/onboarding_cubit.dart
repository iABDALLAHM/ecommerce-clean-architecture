import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/repositories/local_storage_repository/local_storage_repository.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/cubits/onboarding_cubit/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required this.sharedPrefsService,
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository,
       super(InitialOnBoardingState());

  final SharedPrefService sharedPrefsService;
  final LocalStorageRepository _localStorageRepository;

  void handleSkipOnboarding() async {
    emit(LoadingOnBoardingState());
    await _localStorageRepository.setBoolean(key: kOnBoardingSeen, value: true);

    emit(SuccessSkipOnBoardingState());
  }
}
