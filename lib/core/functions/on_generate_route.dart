import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/register_view.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/check_out_view.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/main_view.dart';
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
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => RegisterView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());
    case CheckOutView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            CheckOutView(cartItems: settings.arguments as List<CartItemEntity>),
      );
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
