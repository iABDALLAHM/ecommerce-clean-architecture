import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/on_generate_route.dart';
import 'package:ecommerce_clean_architecture/features/splash/presentation/views/splash_view.dart';
import 'package:ecommerce_clean_architecture/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale("ar"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: kFontFamily, colorSchemeSeed: Colors.white),
      onGenerateRoute: onGenetateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
