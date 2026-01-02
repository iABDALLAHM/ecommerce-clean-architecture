import 'package:ecommerce_clean_architecture/core/functions/on_generate_route.dart';
import 'package:ecommerce_clean_architecture/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Cairo", colorSchemeSeed: Colors.white),
      onGenerateRoute: onGenetateRoute,
      initialRoute: OnBoardingView.routeName,
    );
  }
}
