import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/services/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/manager/onboarding_cubit/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({required this.sharedPrefsService})
    : super(OnboardingInitial());

  final SharedPrefService sharedPrefsService;

  void handleSkipOnboarding() {
    sharedPrefsService.setBool(key: kOnBoardingSeen, value: true);
    emit(SuccessSkipOnBoarding());
  }
}
