import 'package:ecommerce_clean_architecture/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

Route onGenetateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
