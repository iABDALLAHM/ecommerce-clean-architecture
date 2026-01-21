import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/on_generate_route.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/features/splash/presentation/views/splash_view.dart';
import 'package:ecommerce_clean_architecture/firebase_options.dart';
import 'package:ecommerce_clean_architecture/generated/l10n.dart';
import 'package:ecommerce_clean_architecture/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Supabase.initialize(url: kSupabaseUrl, anonKey: kSupabaseApiKey);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefsService.init();
  setupGetIt();
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
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFFFFFF),
        fontFamily: kFontFamily,
      ),
      onGenerateRoute: onGenetateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
