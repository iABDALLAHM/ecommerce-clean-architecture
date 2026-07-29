import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/cubits/change_theme_cubit/change_theme_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/change_theme_cubit/change_theme_state.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_themes.dart';
import 'package:ecommerce_clean_architecture/firebase_options.dart';
import 'package:ecommerce_clean_architecture/generated/codegen_loader.g.dart';
import 'package:ecommerce_clean_architecture/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Supabase.initialize(url: kSupabaseUrl, anonKey: kSupabaseApiKey);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupGetIt();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale("en"), Locale("ar")],
      path: 'assets/translations',
      fallbackLocale: Locale("ar"),
      assetLoader: CodegenLoader(),
      child: const ECommerceApp(),
    ),
  );
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<GetUserDataCubit>()),
        BlocProvider(create: (context) => ChangeThemeCubit()),
      ],
      child: Builder(
        builder: (context) {
          return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
            builder: (_, state) {
              return MaterialApp.router(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                routerConfig: AppRoutes.router,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: state.currentTheme,
              );
            },
          );
        },
      ),
    );
  }
}
