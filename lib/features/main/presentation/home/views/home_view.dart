import 'package:ecommerce_clean_architecture/features/main/presentation/core/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button_navigaton_bar.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/widgets/main_view_body.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/widgets/main_view_body_bloc_consumer.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/widgets/multi_main_view_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = "Main";

  @override
  Widget build(BuildContext context) {
    int currentBody = context.watch<BottomNavigationCubit>().state.currentPage;
    return MultiMainViewBlocProvider(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: SafeArea(
          child: MainViewBodyBlocListener(
            child: MainViewBody(currentBody: currentBody),
          ),
        ),
      ),
    );
  }
}
