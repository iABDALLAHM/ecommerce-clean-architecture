import 'package:ecommerce_clean_architecture/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:ecommerce_clean_architecture/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route onGenetateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => LoginView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
